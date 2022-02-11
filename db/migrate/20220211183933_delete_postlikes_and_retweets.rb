class DeletePostlikesAndRetweets < ActiveRecord::Migration[7.0]
  def change
    drop_table :postlikes 
    drop_table :postretweets
  end
end
