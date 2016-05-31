class RatingsController < ApplicationController
  def index
    @ratings = Rating.all
  end

  def show
    @rating = Rating.find(params[:id])
  end

  def new
    @rating = Rating.new
  end

  def create
    @rating = Rating.new
    @rating.user_id = params[:user_id]
    @rating.restaurant_id = params[:restaurant_id]
    @rating.rating = params[:rating]
    @rating.comments = params[:comments]

    if @rating.save
      redirect_to "/restaurants", :notice => "Your rating was added! Tastefind is getting smarter!"
    else
      redirect_to "/restaurants"
    end
  end

  def edit
    @rating = Rating.find(params[:id])
  end

  def update
    @rating = Rating.find(params[:id])

    @rating.user_id = params[:user_id]
    @rating.restaurant_id = params[:restaurant_id]
    @rating.rating = params[:rating]
    @rating.comments = params[:comments]

    if @rating.save
      redirect_to :back, :notice => "Your rating was updated! Tastefind is getting smarter!"
    else
      render 'edit'
    end
  end

  def destroy
    @rating = Rating.find(params[:id])

    @rating.destroy

    redirect_to "/ratings", :notice => "Rating deleted."
  end
end
