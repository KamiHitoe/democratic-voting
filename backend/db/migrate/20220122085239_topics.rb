class Topics < ActiveRecord::Migration[7.0]
  def change
    add_column :topics, :timestamp, :string
  end
end
