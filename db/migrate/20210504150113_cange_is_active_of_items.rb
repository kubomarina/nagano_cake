class CangeIsActiveOfItems < ActiveRecord::Migration[5.2]
  def up
   change_column :items, :is_active, :boolean, default:0, null:false
  end
  
  def down
   change_column :items, :is_active, :boolean, default: false, null: false
  end
end
