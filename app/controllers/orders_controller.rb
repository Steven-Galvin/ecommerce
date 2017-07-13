class OrdersController < ApplicationController

  def index
    if current_user
      @orders = Order.all
    end
  end

  def destroy
    @order = Order.find(params[:id])
    @order.destroy
    respond_to do |format|
      format.html { redirect_to orders_url, notice: 'Order was successfully destroyed.' }
      format.json { head :no_content }
    end
  end



  # def reset_cart
  #   flash[:notice] = "Thanks for placing your order. It is now processing."
  #   order = current_order
  #   order.status = "processing"
  #   order.save
  #   current_order
  # end

private
  def order_params
    params.require(:order).permit(:status, :user_id, :price)
  end
end
