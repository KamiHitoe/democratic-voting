class CreateReportTopics < ActiveRecord::Migration[6.0]
  def change
    create_table :report_topics do |t|
      t.references :user, null: false, foreign_key: true
      t.references :topic, null: false, foreign_key: true

      t.timestamps
    end
  end
end
