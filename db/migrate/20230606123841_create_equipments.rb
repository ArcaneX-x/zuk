class CreateEquipments < ActiveRecord::Migration[7.0]
  def change
    create_table :equipments do |t|
      t.references :education_material, null: false, foreign_key: true

      t.string :title, null: false
      t.timestamps
    end
  end
end
