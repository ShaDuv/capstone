class Profile < ApplicationRecord
  belongs_to :topic
  belongs_to :genders
end
