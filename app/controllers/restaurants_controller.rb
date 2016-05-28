class RestaurantsController < ApplicationController
  def index
    @restaurants = Restaurant.all
  end

  def show
    @restaurant = Restaurant.find(params[:id])
  end

  def new
    @restaurant = Restaurant.new
  end

  def create
    @restaurant = Restaurant.new
    @restaurant.name = params[:name]
    @restaurant.address = params[:address]
    @restaurant.zip = params[:zip]
    @restaurant.city = params[:city]
    @restaurant.st = params[:st]
    @restaurant.cuisine = params[:cuisine]
    @restaurant.cost = params[:cost]
    @restaurant.reservations = params[:reservations]
    @restaurant.wifi = params[:wifi]

    if @restaurant.save
      redirect_to "/restaurants", :notice => "Restaurant created successfully."
    else
      render 'new'
    end
  end

  def edit
    @restaurant = Restaurant.find(params[:id])
  end

  def update
    @restaurant = Restaurant.find(params[:id])

    @restaurant.name = params[:name]
    @restaurant.address = params[:address]
    @restaurant.zip = params[:zip]
    @restaurant.city = params[:city]
    @restaurant.st = params[:st]
    @restaurant.cuisine = params[:cuisine]
    @restaurant.cost = params[:cost]
    @restaurant.reservations = params[:reservations]
    @restaurant.wifi = params[:wifi]

    if @restaurant.save
      redirect_to "/restaurants", :notice => "Restaurant updated successfully."
    else
      render 'edit'
    end
  end

  def destroy
    @restaurant = Restaurant.find(params[:id])

    @restaurant.destroy

    redirect_to "/restaurants", :notice => "Restaurant deleted."
  end


end
