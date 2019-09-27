class ProfilesController < ApplicationController

    def create
      id = params[:id]
      @profiles = Profiles.find_by_id(id)
      unless @profiles
        agent = ScraperAgent.new()
        agent.login
        profile_data = agent.topic_profiles(id)
        @profile = Profile.create(profile_data)
      end
      render :show
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
end
