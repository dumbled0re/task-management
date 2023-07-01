class User < ApplicationRecord
  # パスワードのハッシュ化
  has_secure_password
end
