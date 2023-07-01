class User < ApplicationRecord
  # パスワードのハッシュ化
  has_secure_password

  validates :name, presence: true
  validates :email, presence: true, uniqueness: true
end
