class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|
      
      t.integer :shipping_cost
      t.integer :total_payment
      t.integer :payment_method
      t.string :shipping_name
      t.string :shipping_adress
      t.integer :shipping_post_code
      t.integer :order_status

      t.timestamps
    end
  end
end
