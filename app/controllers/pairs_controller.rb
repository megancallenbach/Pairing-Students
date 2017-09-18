class PairsController < ApplicationController

  def index
    @pairs = Pair.all
    @users = User.all
  end

  def show
    
  end

  def create
  end


end
