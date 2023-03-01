require 'rails_helper'

RSpec.describe 'finds all subscriptions for a customer' do
  it 'successfully finds all subs for customer' do
    customer = FactoryBot.create(:customer)
    subscription_customers = FactoryBot.create_list(:subscription_customer, 5, customer_id: customer.id)

    headers = { "CONTENT_TYPE" => "application/json" }
    get "/api/v1/customers/#{customer.id}/subscriptions", headers: headers

    subscriptions = JSON.parse(response.body, symbolize_names: true)[:data]

    expect(response).to be_successful
    expect(response).to have_http_status(200)
    expect(subscriptions.count).to eq(5)
    expect(subscriptions.first).to be_a(Hash)
    expect(subscriptions.first[:attributes][:title]).to be_a(String)
    expect(subscriptions.first[:attributes][:price]).to be_a(Float)
  end
end