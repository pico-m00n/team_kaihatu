class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :name_family,  presence: true
  validates :name_first, presence: true
  validates :name_kana_family,  presence: true, format: {with: /\A[\p{katakana}\p{blank}ー－]+\z/, message: 'はカタカナで入力して下さい。'}
  validates :name_kana_first, presence: true, format: {with: /\A[\p{katakana}\p{blank}ー－]+\z/, message: 'はカタカナで入力して下さい。'}
  validates :phone_number, presence: true, format: {with: /\A\d{10}$|^\d{11}\z/, message: '10桁か11桁の電話番号を入力してください。'}
  validates :post_code,  presence: true, format: {with: /\A\d{7}\z/}
  validates :address, presence: true

  has_many :shipping_adresses, dependent: :destroy
  has_many :orders, dependent: :destroy
  has_many :cart_items, dependent: :destroy


end
