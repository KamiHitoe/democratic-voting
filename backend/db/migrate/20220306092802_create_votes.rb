class CreateVotes < ActiveRecord::Migration[6.0]
  def change
    create_table :votes do |t|
      t.references :user, null: false, foreign_key: true
      t.references :topic, null: false, foreign_key: true
      t.string :sex
      t.string :string
      t.integer :age
      t.string :chosen_option
      t.string :integer

      t.timestamps
    end
  end
end
