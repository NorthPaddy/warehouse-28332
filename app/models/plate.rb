class Plate < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :mold
  belongs_to_active_hash :thickness
  belongs_to_active_hash :hardness
  belongs_to_active_hash :plate_color
  belongs_to_active_hash :plate_width
  belongs_to_active_hash :plate_length

  belongs_to :user
  belongs_to :warehouse
  has_many :addresses, through: warehouses

  with_options presence: true do
    validates :mold_id, :thickness_id, :hardness_id,
              :plate_color,:plate_width,:plate_length
    validates :number_of_sheets, format: { with: /\A[0-9]+\z/ }
  end

  with_options numericality: { other_than: 1 } do
    validates :mold_id
    validates :thickness_id
    validates :hardness_id
    validates :plate_color_id
    validates :plate_width_id
    validates :plate_length_id
  end
end
