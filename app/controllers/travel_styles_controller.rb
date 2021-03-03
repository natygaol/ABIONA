class TravelStylesController < ApplicationController
  def index
    @travel_styles = TravelStyle.all
  end

  private

  # def castle_params
  #   params.require(:travel_styles).permit(:title, :file)
  # end
end
