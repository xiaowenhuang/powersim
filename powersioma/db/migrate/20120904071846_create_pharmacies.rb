class CreatePharmacies < ActiveRecord::Migration
  def self.up
    create_table :pharmacies do |t|
      t.string :name
      t.text :reason
      t.string :begin_date
      t.string :end_date
      t.string :phone
      t.string :address

      t.timestamps
    end
  end

  def self.down
    drop_table :pharmacies
  end
end
