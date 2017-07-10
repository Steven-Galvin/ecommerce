class ProductsController < ApplicationController
  def index
    @products = Product.all
    @order_item = current_order.order_items.new
    # best_seller_object = Bestseller.new
    # @bestseller = best_seller_object.get_bestseller_list
   end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      flash[:notice] = "Product successfully added!"
      redirect_to  products_path
    else
      render :new
    end
  end
#   def edit
#   @product = Product.find(params[:id])
# end
#
# def update
#   @order = current_order
#   @product = Product.find(params[:id])
#   @product.update(product_params)
#   if @product.save
#     redirect_to "/orders/#{@order.id}"
#   else
#     flash[:alert] = "There was a problem updating the product"
#     render :edit
#   end
# end

def destroy
  @product = Product.find(params[:id])
  if @product.destroy
    flash[:notice] = "Product successfully removed!"
    redirect_to products_path
  end
end

private

  def product_params
    params.require(:product).permit(:name, :price)
  end
end
