class Sitter < ApplicationRecord
  belongs_to :user
  has_one_attached :picture
  validates :name, :description, presence: true
end
