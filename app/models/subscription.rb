class Subscription < ApplicationRecord
  has_many :subscription_customers
  has_many :subscription_teas
  has_many :customers, through: :subscription_customers
  has_many :teas, through: :subscription_teas

  validates_presence_of :price, :title
end
