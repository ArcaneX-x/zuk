class CreateCatalogues < ActiveRecord::Migration[7.0]
  def change
    create_table :catalogues do |t|
      t.string :title, null: false
      t.text :description, null: false

      t.timestamps
    end
  end
end
