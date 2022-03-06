class Like < ApplicationRecord
  # model association
  belongs_to :user
  belongs_to :comment

  # validate presence
  validates(:user_id,
            :comment_id,
            { presence: true })
end
