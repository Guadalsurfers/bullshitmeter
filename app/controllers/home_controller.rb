class HomeController < ApplicationController
  def index
    @subscriptor = Subscriptor.new
  end
end
