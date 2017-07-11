class OrderItemsController < ApplicationController

  def create
    @order = current_order
    @item = @order.order_items.new(item_params)
    @order.save
    session[:order_id] = @order.id
    redirect_to products_path
  end

  def destroy
    @order = current_order
    @item = @order.order_items.find(params[:id])
    @item.destroy
    if @order.save
      respond_to do |format|
       format.html { redirect_to cart_path }
       format.js
     end
   else
     render :new
   end
  end

  private

  def item_params
    params.require(:order_item).permit(:quantity, :product_id)
  end
end
