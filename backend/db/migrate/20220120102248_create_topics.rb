class CreateTopics < ActiveRecord::Migration[7.0]
  def change
    create_table :topics do |t|
      t.integer :user_id
      t.integer :category_id
      t.string :title
      t.text :description
      t.string :option_1
      t.string :option_2
      t.string :option_3
      t.string :option_4
      t.string :option_1_num
      t.string :option_2_num
      t.string :option_3_num
      t.string :option_4_num
      t.string :img_path

      t.timestamps
    end
  end
end
