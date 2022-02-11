class DeleteUserFromFriends < ActiveRecord::Migration[7.0]
  def change
    remove_column :friends, :user_id
  end
end
