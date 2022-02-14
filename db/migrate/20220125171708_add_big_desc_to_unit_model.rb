class AddBigDescToUnitModel < ActiveRecord::Migration[5.2]
  def change
    add_column :units, :big_desc, :string
  end
end
