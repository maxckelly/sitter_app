class AddSocialLinkToSitters < ActiveRecord::Migration[5.2]
  def change
    add_column :sitters, :social_link, :text
  end
end
