class ToursController < ApplicationController
  def index
    @pagy, @tours = pagy(Tour
                .by_duration(search_params[:duration])
                .by_title(search_params[:title])
                .by_price(search_params[:min_price], search_params[:max_price]), items: 4)
    @tours_all = Tour.all
  end

  def show
    @tour = Tour.find(params[:id])
  end

  def new
    @tour = Tour.new
  end

  def edit
    @tour = Tour.find(params[:id])
  end

  def create
    @tour = Tour.new(tour_params)
    if @tour.save
      redirect_to tours_path
    else
      render 'new'
    end
  end

  def update
    @tour = Tour.find(params[:id])
    if @tour.update_attributes(tour_params)
      redirect_to tour_path(@tour)
    else
      render 'edit'
    end
  end

  def destroy
    @tour = Tour.find(params[:id])
    @tour.destroy

    redirect_to tours_path
  end

  private
  def search_params
    params.permit(:duration, :title, :min_price, :max_price)
  end

  def tour_params
    params.require(:tour).permit(:user_id, :title, :image, :price, :category, :description, :program, :city, :date, :duration)
  end
end
