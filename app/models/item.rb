class Item < ApplicationRecord
   belongs_to :genre

  has_one_attached :image
  validates :name, length: {maximum: 20, minimum: 2},  presence:true

  validates :introduction, :price, presence: true
  validates  :status, inclusion: {in: [true, false]}


  # 消費税の計算 roundで小数点の切り上げ
  def add_tax_price
        (self.price * 1.10).round
  end
  #itemがcart_itemの所有者
  has_many :cart_items, dependent: :destroy
end
