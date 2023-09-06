class HomeController < ApplicationController
  def index
    if signed_in?
      redirect_to panel_url
    else
      render :index
    end
  end
end