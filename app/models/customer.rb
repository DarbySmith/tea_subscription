class Customer < ApplicationRecord
  has_many :subscription_customers
  has_many :subscriptions, through: :subscription_customers
  has_many :subscription_teas, through: :subscriptions
  has_many :teas, through: :subscription_teas

  validates_presence_of :first_name, :last_name, :address
  validates :email, presence: true, uniqueness: true
end
