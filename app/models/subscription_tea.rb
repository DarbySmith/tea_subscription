class SubscriptionTea < ApplicationRecord
  belongs_to :tea
  belongs_to :subscription
  has_many :subscription_customers, through: :subscription
  has_many :customers, through: :subscription_customers
end
