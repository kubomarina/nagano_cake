class RemoveItemidFromItems < ActiveRecord::Migration[5.2]
  def change
    remove_column :items, :itemid, :integer
  end
end
