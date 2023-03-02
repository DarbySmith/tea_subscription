customers = FactoryBot.create_list(:customer, 5)
subscriptions = FactoryBot.create_list(:subscription, 5)
teas = FactoryBot.create_list(:tea, 5)

customers.each do |customer|
  SubscriptionCustomer.create!(customer: customer, subscription: subscriptions.sample, status: "active", frequency: "weekly")
end

teas.each do |tea|
  SubscriptionTea.create!(tea: tea, subscription: subscriptions.sample)
end
