class CreatePlates < ActiveRecord::Migration[6.0]
  def change
    create_table :plates do |t|
      t.integer    :mold_id,          null:false
      t.integer    :thickness_id,     null:false
      t.integer    :hardness_id,      null:false
      t.integer    :plate_color_id,   null:false
      t.integer    :plate_width_id,   null:false
      t.integer    :plate_length_id,  null:false
      t.integer    :number_of_sheets, null:false
      t.references :user,             null:false, foreign_key: true
      t.timestamps
    end
  end
end
