class Removedconfirmedfromfriendship < ActiveRecord::Migration[7.0]
  def change
    remove_column :friendships, :confirmed
  end
end
