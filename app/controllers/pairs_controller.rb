class PairsController < ApplicationController
  before_action :authorize_admin, only: :index

  def index
    @pairs = Pair.all
    @pair = Pair.first
    @users = User.all
    # @pair = Pair.new
    @users = User.all
  end

  def show
    @pair = current_user.pair
    @users = Pair.first.users
  end

end
