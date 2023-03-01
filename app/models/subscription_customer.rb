class SubscriptionCustomer < ApplicationRecord
  belongs_to :customer
  belongs_to :subscription
  has_many :subscription_teas, through: :subscription
  has_many :teas, through: :subscription_teas

  validates_presence_of :status, :frequency

  enum status: { active: 0, skipped: 1, cancelled: 2 }
  enum frequency: { weekly: 0, bi_monthly: 1, monthly: 2 }
end
