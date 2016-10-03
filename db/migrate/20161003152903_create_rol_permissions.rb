class CreateRolPermissions < ActiveRecord::Migration
  def change
    create_table :rol_permissions do |t|
      t.integer :rol_id
      t.integer :permission_id
      t.timestamps
    end
  end
end
