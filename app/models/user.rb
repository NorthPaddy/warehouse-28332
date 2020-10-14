class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable,
         authentication_keys: [:name, :employee_number]

  has_many :plates
  has_many :warehouses

  with_options presence: true do
    validates :name
    validates :employee_number, uniqueness: true
    PASSWORD_REGEX = /\A[a-z\d]{6,}+\z/i.freeze
    validates :password, format: { with: PASSWORD_REGEX }
  end

  def email_required?
    false
  end

  def email_changed?
    false
  end

  def will_save_change_to_email?
    false
  end

  def self.guest
    find_or_create_by!(name:"テストユーザー", employee_number:"0000") do |user|
      user.password = SecureRandom.urlsafe_base64
    end
  end
end
