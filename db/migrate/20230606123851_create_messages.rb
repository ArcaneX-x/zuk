class CreateMessages < ActiveRecord::Migration[7.0]
  def change
    create_table :messages do |t|
      t.references :messagable, polymorphic: true, null: false

      t.text :body, null: false
      t.timestamps
    end
  end
end
