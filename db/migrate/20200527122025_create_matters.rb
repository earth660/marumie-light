class CreateMatters < ActiveRecord::Migration[6.0]
  def change
    create_table :matters do |t|
      t.references :accounts, null: false, foreign_key: true
      t.string :control_number, limit: 20, null:false
      t.string :category_name, limit: 30
      t.string :last_modifier, limit: 50
      t.string :customer, limit: 30

      t.timestamps
    end
    add_index :matters, :control_number, unique: true
  end
end
