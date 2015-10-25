class AddColumnToUsers < ActiveRecord::Migration
  def change
    add_column :users,:member,:string
    add_column :users,:profile,:text
    add_column :users,:works,:string
    add_column :users,:user_name,:string
  end
end
