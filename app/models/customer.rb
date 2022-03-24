class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

 enum is_deleted: { validity: 0, quit: 1 }

  has_many :shipping_adresses
  has_many :orders
  
  def active_for_authentication?
    super && (is_deleted == false)
  end
  
   has_many :cart_items

end
