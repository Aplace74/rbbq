class BarbecuesController < ApplicationController
  def index
    @barbecues = Barbecue.all
  end
end
