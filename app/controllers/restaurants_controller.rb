require 'open-uri'
require 'json'

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
    full_address = @restaurant.address + " " + @restaurant.zip.to_s
    url_safe_street_address = URI.encode(full_address)
    url = "https://maps.googleapis.com/maps/api/geocode/json?address=" + url_safe_street_address
    parsed_data = JSON.parse(open(url).read)
    @restaurant.lat= parsed_data["results"][0]["geometry"]["location"]["lat"].to_s
    @restaurant.lng = parsed_data["results"][0]["geometry"]["location"]["lng"].to_s
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
    full_address = @restaurant.address + " " + @restaurant.zip.to_s
    url_safe_street_address = URI.encode(full_address)
    url = "https://maps.googleapis.com/maps/api/geocode/json?address=" + url_safe_street_address
    parsed_data = JSON.parse(open(url).read)
    @restaurant.lat= parsed_data["results"][0]["geometry"]["location"]["lat"].to_s
    @restaurant.lng = parsed_data["results"][0]["geometry"]["location"]["lng"].to_s

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
