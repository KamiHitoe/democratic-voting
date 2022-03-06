class CreateTopics < ActiveRecord::Migration[6.0]
  def change
    create_table :topics do |t|
      t.integer :category_id
      t.string :title
      t.text :description
      t.string :option_1
      t.string :option_2
      t.string :option_3
      t.string :option_4
      t.integer :option_1_num
      t.integer :option_2_num
      t.integer :option_3_num
      t.integer :option_4_num
      t.integer :voted_num
      t.string :sex
      t.integer :age
      t.string :img_path
      t.string :timestamp
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
