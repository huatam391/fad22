class ApplicationRecord < ActiveRecord::Base
  scope :desc_by_create_at, ->{order created_at: :desc}
  self.abstract_class = true
end
