class Matter < ApplicationRecord
  # accountモデルとの依存関係
  belongs_to :account

  #バリデーション
  validates :control_number, length: { maximum: 20 }, uniqueness: true, presence: true
  validates :category_name, length: { maximum: 30 }
  validates :last_modifier, length: { maximum: 50 }
  validates :customer, length: { maximum: 30 }
end
