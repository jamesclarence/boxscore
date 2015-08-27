class AddRoleAndFirstNameAndLastNameToUsers < ActiveRecord::Migration
  def change
    add_column :users, :role, :string
    add_column :users, :firstname, :string
    add_column :users, :lastname, :string
  end
end
