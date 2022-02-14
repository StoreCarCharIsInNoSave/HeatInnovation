class AddSomeFieldsToUnitModel < ActiveRecord::Migration[5.2]
  def change
    add_column :units, :address, :string
    add_column :units, :leader, :string
    add_column :units, :legal_phone, :string
    add_column :units, :leader_phone, :string
  end
end
