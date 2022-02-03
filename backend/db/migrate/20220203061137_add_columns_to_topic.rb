class AddColumnsToTopic < ActiveRecord::Migration[7.0]
  def change
    add_column :topics, :sex, :boolean
    add_column :topics, :age, :integer
  end
end
