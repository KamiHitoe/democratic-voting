class Comment < ApplicationRecord
  # model association
  belongs_to :user
  belongs_to :topic
  has_many :likes, dependent: :destroy
  has_many :report_comments, dependent: :destroy

  # set default value
  after_initialize :set_defaults, unless: :persisted?

  # validate presence
  validates(:user_id,
            :text,
            { presence: true })

  # validate string length
  validates(:text,
            { length: {
              maximum: 1000,
              message: 'this comment is too long'
            }
})

  def set_defaults
    timestamp = Time.now.to_formatted_s(:db)
    timestamp = timestamp.scan(/\d{4}-\d{2}-\d{2}\s\d+:\d+/)[0]
    # timestamp = timestamp.gsub(/-/, '/')
    self.timestamp ||= timestamp
  end
end
