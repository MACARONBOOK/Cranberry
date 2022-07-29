class CreateDeliveryAddresses < ActiveRecord::Migration[6.1]
  def change
    create_table :delivery_addresses do |t|
      t.references :customer, foreign_key: true
      t.string :postal_code, null: false, default: ""
      t.string :address, null: false, default: ""
      t.string :name, null: false, default: ""

      t.timestamps
    end
    add_index :delivery_addresses, :id,                   unique: true
  end
end
