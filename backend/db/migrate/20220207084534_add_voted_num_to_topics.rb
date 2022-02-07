class AddVotedNumToTopics < ActiveRecord::Migration[7.0]
  def change
    add_column :topics, :voted_num, :integer
  end
end
