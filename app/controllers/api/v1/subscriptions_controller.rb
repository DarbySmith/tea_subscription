class Api::V1::SubscriptionsController < ApplicationController
  def index
    if params[:customer_id]
      customer = Customer.find(params[:customer_id])
      render json: SubscriptionsSerializer.new(customer.subscriptions)
    end
  end
end