class ProfilesController < ApplicationController

    def new
      id = params[:site_id]
      @profiles = Profile.find_by_id(id)
      unless @profiles
        agent = ScraperAgent.new()
        agent.login
        @profiles = agent.topic_profiles(id)
        @profiles.each do |user|
          Profile.create(:user_site_id => user.userid,
                         :topic_id => id,
                         :role => user.roll,
                         :age=> user.age,
                         :sex=> user.sex,
                         :minor_location=> user.minor_location,
                         :major_location=> user.major_location,
                         :action=> user.action

          )
        end
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
