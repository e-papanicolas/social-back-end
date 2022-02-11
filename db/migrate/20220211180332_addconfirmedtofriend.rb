class Addconfirmedtofriend < ActiveRecord::Migration[7.0]
  def change
    add_column :friends, :confirmed, :boolean
  end
end
