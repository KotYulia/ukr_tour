class ToursController < ApplicationController
  def index
    @tours = Tour.all
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

  def tour_params
    params.require(:tour).permit(:title, :image, :price, :category, :description, :program, :city, :date, :duration)
  end
end
