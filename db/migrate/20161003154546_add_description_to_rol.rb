class AddDescriptionToRol < ActiveRecord::Migration
  def change
  	add_column :rols, :description , :text
  end
end
