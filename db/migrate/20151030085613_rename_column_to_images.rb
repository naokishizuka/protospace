class RenameColumnToImages < ActiveRecord::Migration
  def change
    rename_column :images, :proto_id, :prototype_id
  end
end
