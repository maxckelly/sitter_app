class Parent < ApplicationRecord
  belongs_to :user
  has_one_attached :picture
  validates :mother_name, :father_name, presence: true
end
