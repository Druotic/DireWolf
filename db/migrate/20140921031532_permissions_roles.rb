class PermissionsRoles < ActiveRecord::Migration
  def change
    create_table :permissions_roles, :id=>false  do |t|
      t.integer :permission_id
      t.string :role_id
    end
  end
end
