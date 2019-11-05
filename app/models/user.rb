class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, 
         :confirmable


  belongs_to :role
  has_one :parent
  has_one :sitter
  has_many :meetings


  validates :fullname, presence: true, length: {maximum: 50}
end
