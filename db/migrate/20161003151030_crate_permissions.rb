class CratePermissions < ActiveRecord::Migration
  def change
  	create_table :permissions do |t|
  	t.string :name
    t.timestamps
  end
end
end
