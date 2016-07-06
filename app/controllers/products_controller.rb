class ProductsController < ApplicationController
  before_action :set_type

  def new
    @product = Product.new
  end

  def create
  end

  def show
    @product = Product.find(params[:id])
    @reviews = @product.reviews
  end

  def search
    @results = Product.search_by_name(params[:search_term])
  end

  def list
    @results = Product.first(6)
  end

  def front
  end
end
