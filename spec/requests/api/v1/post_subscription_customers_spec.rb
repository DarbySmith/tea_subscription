require 'rails_helper'

RSpec.describe 'subscribes a customer to a subscription', type: :request do
  it 'creates a new subscription to a customer' do
    customer = FactoryBot.create(:customer)
    subscription = FactoryBot.create(:subscription)

    info = {
      "customer_id": customer.id,
      "subscription_id": subscription.id,
      "frequency": "weekly",
      "status": "active"
    }

    headers = { "CONTENT_TYPE" => "application/json" }
    post '/api/v1/subscription_customers', headers: headers, params: JSON.generate(info)

    last_subscription_customer = SubscriptionCustomer.last

    expect(response).to be_successful
    expect(response).to have_http_status(201)
    expect(last_subscription_customer.customer_id).to eq(customer.id)
    expect(last_subscription_customer.subscription_id).to eq(subscription.id)
  end

  it 'returns an error if the customer is not valid' do
    subscription = FactoryBot.create(:subscription)

    info = {
      "customer_id": 2,
      "subscription_id": subscription.id,
      "frequency": "weekly",
      "status": "active"
    }

    headers = { "CONTENT_TYPE" => "application/json" }
    post '/api/v1/subscription_customers', headers: headers, params: JSON.generate(info)

    expect(response).to have_http_status(400)
  end
end 