class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
 
  enum role: [:user,:admin]
  validates :email, presence: true
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :role, presence: true
  has_one_time_password
  enum otp_module: { disabled: 0, enabled: 1 }, _prefix: true
  attr_accessor :otp_code_token
  has_one :resume, :dependent => :destroy
end
