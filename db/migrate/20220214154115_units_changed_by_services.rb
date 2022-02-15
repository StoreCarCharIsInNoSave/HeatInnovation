class UnitsChangedByServices < ActiveRecord::Migration[5.2]
  def change
    remove_column :units, :address
    remove_column :units, :leader
    remove_column :units, :legal_phone
    remove_column :units, :leader_phone
    rename_table :units, :services
  end
end
