class Address < ApplicationRecord
  belong_to :plate
  has_many :plates, through: warehouses

  with_options presence: true do
    validates :warehouse_number, :warehouse_colum,
    :house_number, :number_of_stage
  end
end
