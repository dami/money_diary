class User < ApplicationRecord
  has_secure_password
  validates :name, {presence: true}

  def diaries
    return Diary.where(user_id: self.id)
  end

end
