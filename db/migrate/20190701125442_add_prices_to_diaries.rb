class AddPricesToDiaries < ActiveRecord::Migration[5.2]
  def change
    add_column :diaries, :price, :integer
  end
end
