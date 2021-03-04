class TravelStylesController < ApplicationController
  def index
    @travel_styles = TravelStyle.all
  end
end
