class Api::V1::SubscriptionCustomersController < ApplicationController
  def create
    customer = Customer.find(params[:customer_id])
    subscription = Subscription.find(params[:subscription_id])
    new_sub = SubscriptionCustomer.new(customer: customer, subscription: 
    subscription, frequency: params[:frequency], status: params[:status])
    
    if new_sub.save
      render json: { "message": "Customer Successfully Subscribed" }, status: :created
    else
      render json: { "errors": new_sub.errors.full_message.to_sentence }, status: 400
    end
  end
end