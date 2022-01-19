class Topic < ApplicationRecord
  # model association
  belongs_to :user
  has_many :comments
end
