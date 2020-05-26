class CreateAccounts < ActiveRecord::Migration[6.0]
  def change
    create_table :accounts do |t|
      # 正式名称
      t.string  :company_name,  null: false,  default: '',  limit: 150
      # 略名
      t.string  :name,          null: false,  default: '',  limit: 20
      # メールアドレス
      t.string  :email,         null: false,  default: ''
      # サブスクリプション
      t.boolean :subscription,  default: false

      # 認証
      t.string    :confirmation_token
      t.datetime  :confirmed_at
      t.datetime  :confirmation_sent_at

      # created_at & updated_at
      t.timestamps
    end

    # 索引を追加し、一意性を持たせる
    add_index :accounts,  :company_name,        unique: true
    add_index :accounts,  :name,                unique: true
    add_index :accounts,  :email,               unique: true             
    add_index :accounts,  :confirmation_token,  unique: true
  end
end
