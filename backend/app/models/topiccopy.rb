class Topic < ApplicationRecord
  # model association
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :votes, dependent: :destroy
  has_many :report_topics, dependent: :destroy

  # set default value
  after_initialize :set_defaults, unless: :persisted?

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
            { length: {
              maximum: 100,
              message: 'this text is too long'
            }
})
  validates(:description,
            { length: {
              maximum: 500,
              message: 'this description is too long'
            }
})

  def set_defaults
    timestamp = Time.now.to_formatted_s(:db)
    timestamp = timestamp.scan(/\d{4}-\d{2}-\d{2}\s\d+:\d+/)[0]
    # timestamp = timestamp.gsub(/-/, '/')
    self.timestamp ||= timestamp
    self.option_1_num ||= 0
    self.option_2_num ||= 0
    self.option_3_num ||= 0
    self.option_4_num ||= 0
    self.voted_num ||= 0
  end
end
