class ChargesController < ApplicationController
  def new
  end

  def create
  @amount = (current_order.total_price).to_i

  customer = Stripe::Customer.create(
    :email => params[:stripeEmail],
    :source  => params[:stripeToken]
  )

  charge = Stripe::Charge.create(
    :customer    => customer.id,
    :amount      => @amount * 100,
    :description => 'Rails Stripe customer',
    :currency    => 'usd'
  )
  redirect_to orders_path
  rescue Stripe::CardError => e
  flash[:error] = e.message
  redirect_to root_path

  end
end
