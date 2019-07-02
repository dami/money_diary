class Diary < ApplicationRecord
  validates :item, {presence: true, length: {maximum: 20}}
  validates :user_id, {presence: true}
  validates :price, {presence: true}
  validates :item_number, {presence: true}
  validates :purchase_date, {presence: true}

  def self.search(search) #self.でクラスメソッドとしている
      Diary.where(['price LIKE ?', "%#{search}%"])
  end

  def user
    return User.find_by(id: self.user_id)
  end

end
