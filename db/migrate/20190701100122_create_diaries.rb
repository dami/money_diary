class CreateDiaries < ActiveRecord::Migration[5.2]
  def change
    create_table :diaries do |t|
      t.integer :user_id
      t.string :item
      t.integer :item_number
      t.date :purchase_date

      t.timestamps
    end
  end
end
