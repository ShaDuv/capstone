class TopicsController < ApplicationController
# require_relative ('../../lib/scraper')
  def index
    @topics = Topic.all
  end

  def show
    @topic = Topic.find(params[:id])
  end

  def create
    # topic_name = params[:name]
    # agent = Agent.new
    # agent.login
    # id = agent.search_for_id(topic_name)

    @topic = Topic.new(site_id: id, name: topic_name)
  end


end
