class CreateEducationMaterials < ActiveRecord::Migration[7.0]
  def change
    create_table :education_materials do |t|
      t.references :catalogue, null: false, foreign_key: true

      t.string :title, null: false
      t.timestamps
    end
  end
end
