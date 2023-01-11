class RenameAuthorIdToUserId < ActiveRecord::Migration[7.0]
  def change
    rename_column :entities, :author_id, :user_id
  end
end
