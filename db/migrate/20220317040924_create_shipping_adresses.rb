class CreateShippingAdresses < ActiveRecord::Migration[6.1]
  def change
    create_table :shipping_adresses do |t|
      
      t.string :shipping_name
      t.string :shipping_adress
      t.string :shipping_post_code

      t.timestamps
    end
  end
end
