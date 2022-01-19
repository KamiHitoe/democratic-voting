class Comment < ApplicationRecord
  # model association
  belongs_to :user
  belongs_to :topic
end
