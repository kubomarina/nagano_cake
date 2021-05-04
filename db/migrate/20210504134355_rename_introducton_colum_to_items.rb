class RenameIntroductonColumToItems < ActiveRecord::Migration[5.2]
  def change
    rename_column :items, :introducton, :introduction
  end
end
