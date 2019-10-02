class Profile < ApplicationRecord
  belongs_to :topic
  has_one :gender
end
