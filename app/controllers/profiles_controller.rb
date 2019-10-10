class ProfilesController < ApplicationController
  def index
    @gender = Gender.all
    @topic = Topic.find(params[:topic_id])
    filter = params[:filter]
    @profiles = @topic.profiles.where(interest_filter(filter)).count
  end

  def new
    topic = Topic.find(params[:topic_id])
    if topic.profiles.empty?
      agent = ScraperAgent.new()
      agent.login
      profiles = agent.topic_profiles(topic.id)
      if profiles[:maxpage] > 0
        topic.maxpage = profiles[:maxpage]
        topic.save!
      end
        profiles = profiles[:results]
        profiles.each do |user|
        gender = Gender.find_by_abv(user[:gender])
        profile = topic.profiles.new(:user_site_id => user[:user_site_id],
          :role => user[:role],
          :age => user[:age],
          :minor_location => user[:minor_location],
          :major_location => user[:major_location],
          :action => user[:action]
        )
        profile.gender = gender
        begin
          profile.save!
        rescue StandardError => e
          logger.error("Gender: #{gender}\n Error: #{e} ")
        end
      end
    end
    redirect_to :action => 'index', topic_id: topic.id
  end

  def search
  end

  private
  def group_by_gender
  end

  def interest_filter(filter)
    case filter
    when "Receiving"
      "action = 'is into receiving'"
    when "Interested"
      "action = 'is into receiving' or action = 'interested in'"
    else
      "action = 'is into receiving' or action = 'interested in' or action = 'is into everything to do with it'"
    end
  end
end
