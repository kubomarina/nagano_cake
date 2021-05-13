class AddColumnToCustomers < ActiveRecord::Migration[5.2]
  def change
    add_column :customers, :is_active, :boolean, default: 'true'
  end
end
