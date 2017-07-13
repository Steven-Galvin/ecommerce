class CartsController < ApplicationController

  def show
    @order_items = current_order.order_items
    if current_order
      @amount = (current_order.total_price).to_i
    else
      @amount = 0
    end
  end

  # def create
  #   customer = Stripe::Customer.create(
  #     :email => params[:stripeEmail],
  #     :source  => params[:stripeToken]
  #   )
  #
  #   charge = Stripe::Charge.create(
  #     :customer    => customer.id,
  #     :amount      => @amount,
  #     :description => 'Rails Stripe customer',
  #     :currency    => 'usd'
  #   )
  #   redirect_to root_path
  #   rescue Stripe::CardError => e
  #   flash[:error] = e.message
  #   redirect_to root_path
  #   # end
  # end
end
