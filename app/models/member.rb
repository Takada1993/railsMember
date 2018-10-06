class Member < ApplicationRecord
  
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  has_secure_password
  
  validates :userName,
    presence: {message: 'ユーザー名は必須です。'}, 
    length: { in: 1..20, message: '20文字以内でご入力ください'}
    
  validates :mailAddress,
    presence: {message: 'メールアドレスは必須です。'},
    length: { in: 1..100, message: '100文字以内でご入力ください。'},
    format: { with: VALID_EMAIL_REGEX }

  validates :password,
    presence: { message: 'パスワードは必須です。' },
    length: { in: 1..20, message: '10文字以上20文字以内でご入力ください。', allow_blank: true},
    confirmation: { message: 'パスワードが一致しません。' }

  validates :password_confirmation,
    presence: { message: 'パスワードは必須です。' }
    
end
