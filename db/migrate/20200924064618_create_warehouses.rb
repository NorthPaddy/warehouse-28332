class CreateWarehouses < ActiveRecord::Migration[6.0]
  def change
    create_table :warehouses do |t|
      t.string     :name,            null:false
      t.string     :warehouse_colum, null:false
      t.string     :address,         null:false
      t.string     :number_of_stage, null:false
      t.references :plate,           null:false, foreign_key: true
      t.timestamps
    end
  end
end
