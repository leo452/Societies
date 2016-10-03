class AddUserIdToRols < ActiveRecord::Migration
  def change
  	add_column :rols, :user_id, :integer
  end
end
