class Comment < ApplicationRecord
  # model association
  belongs_to :topic

  # validate presence
  validates(:user_id,
            :text,
            { presence: true })

  # validate string length
  validates(:text,
    {length: {
      maximum: 1000,
      message: 'this comment is too long',
    }})
end
