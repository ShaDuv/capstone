require 'scraper'
class TopicsController < ApplicationController
  protect_from_forgery with: :reset_session
  def index

    render :index

  end

  def show
    @topic = Topic.find(params[:id])
  end

  def create
    term = params[:term]
    @topic = Topic.find_by_name(term)
    unless @topic
      agent = ScraperAgent.new()
      agent.login
      topic_data = agent.search_for_id(term)
      @topic = Topic.create(topic_data)
    end
    redirect_to :action => 'show', id: @topic.site_id
  end
  
  private
    def topic_params
      params.require(:id).permit(:name)
    end



end
