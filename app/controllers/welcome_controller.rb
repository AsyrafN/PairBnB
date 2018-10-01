class WelcomeController < ApplicationController

  def index
  	@listing = Listing.all.limit(3)
  	if signed_in?
  		render template: 'welcome/home'
  	end
  end

  def search
  	@listing = Listing .where()
    @listing = Listing.search_by_city(params[:city]) if params[:city].present?
    @sear
  end

  def home

  	@listing = Listing.all.limit(3)

  end
end
