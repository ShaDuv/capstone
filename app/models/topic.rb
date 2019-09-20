class Topic < ApplicationRecord
  has_many :datas
  # id = agent.search_for_id(params[:term])
end
