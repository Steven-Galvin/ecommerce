class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_order, :show_total_items
  # before_action :get_order_number


  # def get_order_number
  #   current_order.order_items.length
  #   return 1
  # end

  def show_total_items
    if current_order
      @order_items = current_order.order_items
      quantity_array = []
      @order_items.each do |item|
        quantity_array.push(item.quantity)
      end
      @total_items = quantity_array.sum
    end
  end

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
