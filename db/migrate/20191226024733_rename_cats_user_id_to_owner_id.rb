class RenameCatsUserIdToOwnerId < ActiveRecord::Migration[5.2]
  def change
    rename_column :cats, :user_id, :owner_id
  end
end
