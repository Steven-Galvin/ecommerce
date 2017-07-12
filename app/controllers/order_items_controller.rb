class OrderItemsController < ApplicationController

  def create
    @order = current_order
    item_check(item_params)
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

  def item_check(item_params)
    product_id = item_params['product_id'].to_i
    quantity = item_params['quantity'].to_i
    order = OrderItem.all
    if order.exists?(product_id: product_id)
      item = order.where(product_id: product_id)
      item.first.quantity += quantity
      item.first.save
    else
      @order.order_items.new(item_params)
    end
  end

  def item_params
    params.require(:order_item).permit(:quantity, :product_id)
  end
end
