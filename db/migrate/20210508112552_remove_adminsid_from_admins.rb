class RemoveAdminsidFromAdmins < ActiveRecord::Migration[5.2]
  def change
    remove_column :admins, :adminsid, :integer
  end
end
