class Meeting < ApplicationRecord
  belongs_to :user
  # The below is saying that sitter_user belongs to Sitter controller and parent_user belongs to Parent controller.
  belongs_to :sitter_user, :class_name => 'Sitter'
  belongs_to :parent_user, :class_name => 'Parent'

  # Geocoder
  geocoded_by :address
  
end
