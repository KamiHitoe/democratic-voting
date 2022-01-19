class User < ApplicationRecord
  # model association
  has_many :topics
  has_many :comments
end
