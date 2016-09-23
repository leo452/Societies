class RemoveIdSocietyFromClients < ActiveRecord::Migration
  def change
    remove_column :clients, :society_id, :integer
    remove_column :clients, :periodicidad, :string
    remove_column :clients, :fecha_afiliacion, :date
    remove_column :clients, :fecha_final_afiliacion, :date
    remove_column :clients, :fecha_corte_afiliacion, :date
  end
end
