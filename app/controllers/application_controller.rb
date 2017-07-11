class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_order
  # before_action :get_order_number


  # def get_order_number
  #   current_order.order_items.length
  #   return 1
  # end

  def show
    @order_items = current_order.order_items
  end

  def current_order
    if session[:order_id]
      Order.find(session[:order_id])
    else
      Order.new
    end
  end
end
