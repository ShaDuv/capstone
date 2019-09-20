class TopicsController < ApplicationController
# require_relative ('../../lib/scraper')
  def index
    # @topics = Topic.all
    render :index
  end

  def show
    # @topic = Topic.find(params[:topic])
  end

  def create
    # @topic_name = params[:topic]
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
