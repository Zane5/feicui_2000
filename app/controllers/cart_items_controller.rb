class CartItemsController < ApplicationController
  before_action :require_user

  def index
    @cart_items = current_user.cart_items
  end

  def create
    product = Product.find(params[:product_id])
    cart_product(product)
    redirect_to my_cart_path
  end

  def destroy
    cart_item = CartItem.find(params[:id])
    cart_item.destroy if current_user.cart_items.include?(cart_item)
    redirect_to my_cart_path
  end

  def buy_immediately
    redirect_to my_cart_item_path
  end

  private 

  def cart_product(product)
    CartItem.create(product: product, user: current_user, position: new_cart_item_position) unless current_user_carted_product?(product)
  end

  def new_cart_item_position
    current_user.cart_items.count + 1
  end

  def current_user_carted_product?(product)
    current_user.cart_items.map(&:product).include?(product)
  end
end
