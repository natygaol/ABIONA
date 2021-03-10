class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def change_sent_status
    @trip = Trip.find(params[:trip_id])
    @trip.sent = true
    @trip.save
    redirect_to confirmation_path
  end

  def confirmation
  end

  def home
  end

  # def sent_status
  #   @trip = Trip.find(params[:id])
  #   @trip.sent = true
  #   @trip.save
  #   redirect_to confirmation_path
  # end

end
