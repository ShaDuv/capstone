require 'scraper'
class TopicsController < ApplicationController
  protect_from_forgery with: :reset_session
  def index

    render :index

  end

  def show
    @topic = Topic.find(params[:site_id])
  end

  def create
    agent = ScraperAgent.new()
    agent.login
    term = params[:term]
    topic_id = agent.search_for_id(term)
    @topic = Topic.new(:name => term, :site_id => topic_id)
    @topic.save
    render :show
    # @agent = Agent.new
    # @agent.login
    # @id = agent.search_for_id(topic_name)
    #
    # @topic = Topic.new(site_id: id, name: topic_name)
  end
  private
    def topic_params
      params.require(:topic).permit(:name)
    end



end
