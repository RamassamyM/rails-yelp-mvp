class RestaurantsController < ApplicationController
  before_action :set_restaurant, only: [:show]
  def index
    @restaurants = Restaurant.all
  end

  def show
    @review = Review.new
  end

  def new
    @restaurant = Restaurant.new
  end

  def create
    @restaurant = Restaurant.new(restaurant_params)
    if @restaurant.save
      redirect_to @restaurant
    else
      render :new
    end
  end

  def search
    @restaurants = Restaurant.where("name LIKE ?", "%#{search_params[:query]}%")
    @query = search_params
  end

  private

  def set_restaurant
    @restaurant = Restaurant.find(params[:id])
  end

  def search_params
    params.permit(:query)
  end

  def restaurant_params
    params.require(:restaurant).permit(:name, :address, :phone_number, :category)
  end
end
