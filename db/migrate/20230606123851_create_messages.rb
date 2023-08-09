class CreateMessages < ActiveRecord::Migration[7.0]
  def change
    create_table :messages do |t|
      t.references :messagable, polymorphic: true, index: true

      t.text :body
      t.integer :source_id

      t.timestamps
    end
  end
end
