class AddColumnsToVote < ActiveRecord::Migration[7.0]
  def change
    add_column :votes, :sex, :string
    add_column :votes, :age, :integer
    add_column :votes, :chosen_option, :integer
  end
end
