class Diary < ApplicationRecord
  validates :item, {presence: true, length: {maximum: 20}}
  validates :user_id, {presence: true}


  def user
    return User.find_by(id: self.user_id)
  end

end