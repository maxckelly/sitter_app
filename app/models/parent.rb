class Parent < ApplicationRecord
  belongs_to :user
  validates :mother_name, :father_name, presence: true
end
