require 'rails_helper'

RSpec.describe SubscriptionTea, type: :model do
  describe 'validations' do
    it { should belong_to(:tea) }
    it { should belong_to(:subscription) }
    it { should have_many(:subscription_customers).through(:subscription) }
    it { should have_many(:customers).through(:subscription_customers) }
  end
end
