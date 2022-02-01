class User < ApplicationRecord
  # model association
  has_many :topics
  has_many :comments
  has_many :likes
  has_many :votes

  validates(:username,
            :sex,
            :age,
            { presence: true }
  )
end
