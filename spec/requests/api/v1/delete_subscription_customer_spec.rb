require 'rails_helper'

RSpec.describe 'cancels a customers tea subscription', type: :request do
  it 'successfully cancels a customers tea subscription' do
    customer = FactoryBot.create(:customer)
    subscription = FactoryBot.create(:subscription)
    subscription_customer = FactoryBot.create(:subscription_customer, customer_id: customer.id, subscription_id: subscription.id)

    headers = { "CONTENT_TYPE" => "application/json" }
    delete "/api/v1/subscription_customers/#{subscription_customer.id}", headers: headers

    expect(response).to be_successful
    expect(response).to have_http_status(204)
  end
end