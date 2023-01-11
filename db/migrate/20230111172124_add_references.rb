class AddReferences < ActiveRecord::Migration[7.0]
  def change
    add_reference :entities, :author, foreign_key: { to_table: :users }, index: true
    add_reference :groups, :author, foreign_key: { to_table: :users }, index: true
    change_column :groups, :user_id, :bigint, :null => true
    add_reference :entities, :group, foreign_key: { to_table: :groups }, index: true
    # add_reference :entities, :entity, foreign_key: { to_table: :entities }, index: true
  end
end
