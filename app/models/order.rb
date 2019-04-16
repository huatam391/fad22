class Order < ApplicationRecord
  belongs_to :user
  belongs_to :product
  enum status: {delivering: 0, delivered: 1}
end
