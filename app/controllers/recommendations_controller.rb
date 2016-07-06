class RecommendationsController < ApplicationController
  def index
    @recommendations = Recommendation.all

    @recommendations = Kaminari.paginate_array(current_user.recommended_restaurants).page(params[:page]).per(4)
  end

  def show
    @recommendation = Recommendation.find(params[:id])
  end

  def new
    @recommendation = Recommendation.new
  end

  def create
    @recommendation = Recommendation.new
    @recommendation.user_id = params[:user_id]
    @recommendation.restaurant_id = params[:restaurant_id]
    @recommendation.rating_rec = params[:rating_rec]

    if @recommendation.save
      redirect_to "/recommendations", :notice => "Recommendation created successfully."
    else
      render 'new'
    end
  end

  def edit
    @recommendation = Recommendation.find(params[:id])
  end

  def update
    @recommendation = Recommendation.find(params[:id])

    @recommendation.user_id = params[:user_id]
    @recommendation.restaurant_id = params[:restaurant_id]
    @recommendation.rating_rec = params[:rating_rec]

    if @recommendation.save
      redirect_to "/recommendations", :notice => "Recommendation updated successfully."
    else
      render 'edit'
    end
  end

  def destroy
    @recommendation = Recommendation.find(params[:id])

    @recommendation.destroy

    redirect_to "/recommendations", :notice => "Recommendation deleted."
  end
end
