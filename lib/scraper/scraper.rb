#!/usr/bin/env ruby
require 'nokogiri'
require 'json'
require 'mechanize'

class Agent
  def initialize
    @agent = Mechanize.new
    @agent.history_added = Proc.new {sleep 0.5}
  end

  # log in to site
  # creates a log in
  def login
    # username and password goes here
    login_page = @agent.get 'https://fetlife.com/users/sign_in'
    # log in passing in username and pasword
    form = login_page.forms[0]
    form.field_with(id: 'user_login').value = userid
    form.field_with(id: 'user_password').value = password
    # return the results of loging in
    form.submit
  end

  # search for fetish interact with id=q / find the id number of the topic (ie nails = 249 in the url)
  def search_for_id(search_term)
    search_page = @agent.get 'https://fetlife.com/fetishes'

    form = search_page.form_with(action:"/fetishes/search_results")
    form.field_with(id: 'q').value = search_term

    results = form.submit
    {:id => results.uri.to_s.split("/")[-1], :topic => search_term }
  end
# collects total results of all pages of profile interested in topic
  def topic_profiles(id)
    topic_results = []
    page = 1
    loop do
      profiles_page = @agent.get "https://fetlife.com/fetishes/#{id}/kinksters?page=#{page}"
      data = parse_profiles(profiles_page)
      if data.empty?
        break
      end
      topic_results += data
      page += 1
    end
    topic_results
  end
  # collect profile information from each page of search results
  def parse_profiles(profiles)
    page_results = []
    #gathers profiles into an array and runs
    profiles.search('div.fl-flag__body').each do |profile|
      page_results << parse_profile_details(profile)

    end
    page_results
  end

  def parse_profile_details(profile)
    details = {}
    details[:userid] = profile.search('a.fl-member-card__user').first.attributes['href'].value.split('/')[-1]
    info_data = profile.search('span.fl-member-card__info').first.text.split
    details[:role] = info_data[1]

    # iterates through a string, matching the pattern (regex part) for each match a result is generated and added to the results array. https://stackoverflow.com/questions/14091574/ruby-split-on-numbers-vs-letters/14091786#14091786. /d = digit and /D is not a digit.  Pattern is one or more digits OR 1 or more not digits.
    age_sex = info_data[0].scan(/\d+|\D+/)
    #stores the first position in the array as age
    details[:age] = age_sex[0]
    #stores the second postion in the array as the sex
    details[:sex] = age_sex[1]
    #pushes the results as an object into

    location_data = profile.search('span.fl-member-card__location').first.text.split(',')
    if location_data.count == 1
      details[:major_location] = location_data[0].strip
      details[:minor_location] = nil
    else
      details[:minor_location] = location_data[0].strip
      details[:major_location] = location_data[1].strip
    end

    details[:action] = profile.search('div.fl-member-card__action').first.text.strip

    details
  end
end
# profiles.search('span.fl-member-card__location') stretch goal to add location.

#collect the demographic of the profile (class="fl-member-card__info" for age, sex, and title, class= "fl-member-card__location" for location)
# deal with pagination https://fetlife.com/fetishes/249/kinksters?page=2 (until loop 404 error)
# store the data
# this will allow the data to be called seperate from the class (example exe or from terminal)
if __FILE__ == $0
  agent = Agent.new
  agent.login
  id = agent.search_for_id('nails')
  profiles = agent.topic_profiles(id[:id])
  p profiles
end
