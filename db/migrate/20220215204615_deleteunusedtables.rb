class Deleteunusedtables < ActiveRecord::Migration[7.0]
  def change
    drop_table :friendships 
    drop_table :friends
    drop_table :likes
    
  end
end
