class CreateComments < ActiveRecord::Migration[7.0]
  def change
    create_table :comments do |t|
      t.integer :user_id
      t.integer :parent_id
      t.text :text
      t.integer :like_num
      t.references :topic, null: false, foreign_key: true

      t.timestamps
    end
  end
end
