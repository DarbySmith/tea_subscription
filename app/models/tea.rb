class Tea < ApplicationRecord
  has_many :subscription_teas
  has_many :subscriptions, through: :subscription_teas
  has_many :subscription_customers, through: :subscriptions
  has_many :customers, through: :subscription_customers

  validates_presence_of :title, :description, :temperature, :brew_time
end
