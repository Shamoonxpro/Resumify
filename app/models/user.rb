class User < ApplicationRecord
  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable#, :otp_authenticatable
 
  enum role: [:user,:admin]
  validates :first_name, :last_name, :email,:otp_code_token,:otp_module, presence: true
  validates :role, presence: true
  has_one_time_password
  enum otp_module: { disabled: 0, enabled: 1 }, _prefix: true
  attr_accessor :otp_code_token
end
