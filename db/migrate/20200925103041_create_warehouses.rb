class CreateWarehouses < ActiveRecord::Migration[6.0]
  def change
    create_table :warehouses do |t|
      t.string     :warehouse_number,  null:false
      t.string     :warehouse_colum,   null:false
      t.integer    :house_number,      null:false
      t.integer    :number_of_stage,   null:false
      t.references :user,              null:false, foreign_key: true
      t.references :plate,             null:false, foreign_key: true
      t.timestamps
    end
  end
end
