class Vote < ApplicationRecord
  # model association
  belongs_to :user
  belongs_to :topic

  # validate presence
  validates(:user_id,
            :topic_id,
            { presence: true })
end
