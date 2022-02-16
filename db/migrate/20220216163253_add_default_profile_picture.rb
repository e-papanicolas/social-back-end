class AddDefaultProfilePicture < ActiveRecord::Migration[7.0]
  def up
    change_column :users, :avatar, :string, default: "https://brausermaimonides.org/wp-content/uploads/2014/12/default_profile_pic.jpg"
  end

  def down
    change_column :users, :avatar, :string
  end
end
