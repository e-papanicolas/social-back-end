class Addfriendscolumntousers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :friends, :integer, array: true, default: []
  end
end
