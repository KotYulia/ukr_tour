class UkrainianToursController < ApplicationController
  def index
    @pagy, @tours = pagy(Tour.by_ukrainian_tours
      .by_duration(search_params[:duration])
      .by_title(search_params[:title])
      .by_price(search_params[:min_price], search_params[:max_price]), items: 4)

    @tours_all = Tour.by_ukrainian_tours
  end

  private
  def search_params
    params.permit(:duration, :title, :min_price, :max_price)
  end
end
