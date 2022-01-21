class Topic < ApplicationRecord
  # model association
  has_many :comments, dependent: :destroy

  # validate presence
  validates(:user_id,
            :category_id,
            :title,
            :description,
            :option_1,
            :option_2,
            { presence: true })

  # validate string length
  validates(:title,
            :option_1,
            :option_2,
            :option_3,
            :option_4,
            {length: {
              maximum: 100,
              message: 'this text is too long',
            }})
  validates(:description,
            {length: {
              maximum: 500,
              message: 'this description is too long',
            }})
end
