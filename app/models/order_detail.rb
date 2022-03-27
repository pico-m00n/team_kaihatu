class OrderDetail < ApplicationRecord
 belongs_to :order
 belongs_to :item
 enum item_status: [:着手不可, :製作待ち, :製作中, :製作完了]

  after_update do
    order_details = self.order.order_details
    if order_details.any? {|order_detail| order_detail.item_status == "製作中"} == true
      self.order.update(order_status: "製作中")
    elsif order_details.all? {|order_detail| order_detail.item_status == "製作完了"} == true
    self.order.update(order_status: "発送準備中")
    end
  end
end

