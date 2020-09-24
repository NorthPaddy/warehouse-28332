class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|
      t.string   :warehouse_number,  null:false
      t.string   :warehouse_colum,   null:false
      t.integer  :house_number,      null:false
      t.integer  :number_of_stage,   null:false
      t.timestamps
    end
  end
end
