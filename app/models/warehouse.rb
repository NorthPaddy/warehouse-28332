class Warehouse < ApplicationRecord

  belongs_to :user
  belongs_to :plate

  with_options presence: true do
    validates :warehouse_number, :warehouse_colum,
    :house_number, :number_of_stage
  end
end
