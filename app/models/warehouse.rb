class Warehouse < ApplicationRecord
  
  has_many :plates

  with_options presence: true do
    validates :name, :warehouse_colum, :address, :number_of_stage
  end
end
