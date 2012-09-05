class AddOperatorToPharmacy < ActiveRecord::Migration
  def self.up
    add_column :pharmacies, :operator, :string
  end

  def self.down
    remove_column :pharmacies, :operator
  end
end
