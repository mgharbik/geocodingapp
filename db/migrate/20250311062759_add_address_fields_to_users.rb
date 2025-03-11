class AddAddressFieldsToUsers < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :street, :string
    add_column :users, :city, :string
    add_column :users, :zip, :string
    add_column :users, :latitude, :float
    add_column :users, :longitude, :float
  end
end
