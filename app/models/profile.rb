class Profile < ApplicationRecord
  belongs_to :topic
  belongs_to :gender
end
