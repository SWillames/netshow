class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :videos, dependent: :destroy

  validates_presence_of :first_name, :email, :last_name, :user_name, :password
  validates_uniqueness_of :email, :user_name



end
