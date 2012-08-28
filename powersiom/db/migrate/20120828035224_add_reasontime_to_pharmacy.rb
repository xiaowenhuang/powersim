class AddReasontimeToPharmacy < ActiveRecord::Migration
  def self.up
    add_column :pharmacies, :reason, :text
    add_column :pharmacies, :begin_date, :date
    add_column :pharmacies, :end_date, :date
  end

  def self.down
    remove_column :pharmacies, :end_date
    remove_column :pharmacies, :begin_date
    remove_column :pharmacies, :reason
  end
end
