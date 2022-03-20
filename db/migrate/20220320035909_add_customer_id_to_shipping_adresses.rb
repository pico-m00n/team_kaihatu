class AddCustomerIdToShippingAdresses < ActiveRecord::Migration[6.1]
  def change
    add_column :shipping_adresses, :customer_id, :integer
  end
end
