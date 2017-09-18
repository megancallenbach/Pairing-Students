class PairsController < ApplicationController
  before_action :authorize_admin, only: :index

  def index
    @pairs = Pair.all
    @pair = Pair.new
  end

  def show

  end

  def create
  end


end
