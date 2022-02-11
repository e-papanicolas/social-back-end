class CreateFriendships < ActiveRecord::Migration[7.0]
  def change
    create_table :friendships do |t|
      t.belongs_to :user, null: false, foreign_key: true
      t.belongs_to :friend, null: false, foreign_key: true
      t.boolean :confirmed

      t.timestamps
    end
  end
end
