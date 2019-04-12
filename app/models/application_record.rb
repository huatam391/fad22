class ApplicationRecord < ActiveRecord::Base
  scope :desc_by_create_at, ->{order created_at: :desc}
  scope :desc_by_name, ->{order name: :desc}
  self.abstract_class = true
end
