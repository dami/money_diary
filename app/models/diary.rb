class Diary < ApplicationRecord
  validates :item, {presence: true, length: {maximum: 20}}
  validates :user_id, {presence: true}
  validates :price, {presence: true}
  validates :item_number, {presence: true}
  validates :purchase_date, {presence: true}

  def user
    return User.find_by(id: self.user_id)
  end

end
