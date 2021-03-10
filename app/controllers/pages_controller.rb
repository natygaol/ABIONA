class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def confirmation
  end

  def home
  end
  
end
