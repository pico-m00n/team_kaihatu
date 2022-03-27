class ShippingAdress < ApplicationRecord
 belongs_to :customer

 validates :shipping_post_code,  presence: true, format: {with: /\A\d{7}\z/}
 validates :shipping_adress, presence: true
 validates :shipping_name,  presence: true
end
