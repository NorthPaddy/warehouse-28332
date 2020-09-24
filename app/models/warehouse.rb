class Warehouse < ApplicationRecord
  belong_to :plate
  belong_to :address
end
