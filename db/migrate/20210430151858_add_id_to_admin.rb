class AddIdToAdmin < ActiveRecord::Migration[5.2]
  def change
    add_column :admins, :adminsid, :integer
  end
end
