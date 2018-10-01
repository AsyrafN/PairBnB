class WelcomeController < ApplicationController

  def index
  	if signed_in?
  		render template: 'welcome/home'
  	end
  end
end
