class ProfilesController < ApplicationController
    def index
      @topic = Topic.find(params[:topic_id])
      filter = params[:filter]
      @profiles = @topic.profiles.where(interest_filter(filter)).count
    end

    def new
      @topic = Topic.find(params[:topic_id])

      if @topic.profiles.empty?
        agent = ScraperAgent.new()
        agent.login
        profiles = agent.topic_profiles(@topic.id)
        profiles.each do |user|
        logger.debug user
        @topic.profiles.create!(:user_site_id => user[:userid],
                         :role => user[:role],
                         :age => user[:age],
                         :gender => user[:sex],
                         :minor_location => user[:minor_location],
                         :major_location => user[:major_location],
                         :action => user[:action]
          )
        end
      end
      redirect_to :action => 'index', topic_id: @topic.id
    end
  def search
    # this shouold be somewhere else but it[s okay for now]
    # agent = Agent.new
    # agent.login
    # # save this id and term to a model for the topics
    #
    # # get all the profiles for a topic
    # profiles = agent.topic_profiles(id[:id])
    # json_response profiles
  end
  private
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
