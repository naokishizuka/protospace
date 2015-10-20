class RemoveWorksFromUsers < ActiveRecord::Migration
  def change
    remove_column :users, :works, :string
  end
end
