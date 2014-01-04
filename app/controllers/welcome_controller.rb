class WelcomeController < ApplicationController
  def index
  end

  def show
  	
  end

  def search
	"https://www.googleapis.com/books/v1/volumes?q=#{params[:q]}"
  end
end
