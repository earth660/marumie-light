class Account < ApplicationRecord

  # メールアドレス正規表現
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  # Validations
  # 最新のERD https://app.lucidchart.com/documents/edit/dcf4368f-9e4e-486b-a1df-ed270050f9e9/DtcVdzGUyNfm?shared=true
  validates :company_name,  presence: true, length: { in: 1..150 }
  validates :name,          presence: true, length: { in: 3..20  }, uniqueness: true
  validates :email,         presence: true, uniqueness: true, format: { with: VALID_EMAIL_REGEX }
end
