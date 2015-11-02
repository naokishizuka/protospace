class RenameProtosToPrototypes < ActiveRecord::Migration
  def change
    rename_table :protos, :prototypes
  end
end
