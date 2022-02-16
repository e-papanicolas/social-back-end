class AddColumnsToChats < ActiveRecord::Migration[7.0]
  def change
    change_table :chats do |t|
      t.integer :sender_id
      t.integer :recipient_id
    end
  end
end
