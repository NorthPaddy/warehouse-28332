class HomeController < ApplicationController
  def index
    @plate = Plare.all
    @address = Address.all
  end
end
