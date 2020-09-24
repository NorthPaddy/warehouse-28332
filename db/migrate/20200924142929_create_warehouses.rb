class CreateWarehouses < ActiveRecord::Migration[6.0]
  def change
    create_table :warehouses do |t|
      t.references  :plate,    null:false, foreign_key: true
      t.references  :address,  null:false, foreign_key: true
      t.timestamps
    end
  end
end
