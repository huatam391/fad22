class Order < ApplicationRecord
  belongs_to :user
  has_many :order_details
  enum status: {delivering: 0, delivered: 1}
end
