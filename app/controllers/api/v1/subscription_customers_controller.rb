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

  def destroy
    sub_cust = SubscriptionCustomer.find(params[:id])
    if sub_cust.destroy
      render json: { "message": "Customer Successfuly Unsubscribed" }, status: :no_content
    else
      render json: { "errors": sub_cust.errors.full_message.to_sentence }
    end
  end
end