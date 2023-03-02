class Api::V1::SubscriptionCustomersController < ApplicationController
  def create
    # require 'pry'; binding.pry
    # customer = Customer.find(params[:customer_id])
    # subscription = Subscription.find(params[:subscription_id])
    # require 'pry'; binding.pry
    new_sub = SubscriptionCustomer.new(subscription_customer_params)
    
    if new_sub.save
      render json: { "message": "Customer Successfully Subscribed" }, status: :created
    else
      render json: { "errors": new_sub.errors.full_messages.to_sentence }, status: 400
    end
  end

  def destroy
    sub_cust = SubscriptionCustomer.find(params[:id])
    if sub_cust.destroy
      render json: { "message": "Customer Successfuly Unsubscribed" }
    else
      render json: { "errors": sub_cust.errors.full_messages.to_sentence }
    end
  end

  private

  def subscription_customer_params
    params.require(:subscription_customer).permit(:customer_id, :subscription_id, :frequency, :status)
  end
end