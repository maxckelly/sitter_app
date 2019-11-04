class Sitter < ApplicationRecord
  belongs_to :user
  has_one_attached :picture
  # The below grabs the meetings as we have added a seperate foreign key for both the sitter and the parent.
  has_many :meetings, :class_name => 'Meeting', :foreign_key => 'sitter_user_id'
  validates :name, :description, presence: true
end
