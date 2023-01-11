class RenameCategoryToGroupId < ActiveRecord::Migration[7.0]
  def change
    rename_column :transactions, :category, :group_id
  end
end
