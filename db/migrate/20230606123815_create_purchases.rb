class CreatePurchases < ActiveRecord::Migration[7.0]
  def change
    create_table :purchases do |t|
      t.references :user, null: false, foreign_k ey: true

      t.string :title, null: false
      t.string :currency, null: false
      t.string :status, null: false, default: 'pending'
      t.decimal :amount, precision: 10, scale: 2, null: false
      t.string :provider, default: 'manual', null: false
      t.timestamps
    end
  end
end
