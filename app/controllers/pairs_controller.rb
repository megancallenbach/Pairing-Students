class PairsController < ApplicationController
  before_action :authorize_admin, only: :index

  def index
    @pairs = Pair.all
    @pair = Pair.new
    @users = User.all

  end

  def show

  end

  def create
    @pair = Pair.new
  end


end
