class Changelikescolumn < ActiveRecord::Migration[7.0]
  def up 
    change_column :posts, :likes, :integer, default:0
  end

  def down
    change_column :posts, :likes, :integer
  end
end
