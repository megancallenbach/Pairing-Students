class PairsController < ApplicationController
  before_action :authorize_admin, only: :index

  def index
    @pairs = Pair.all
    @pair = Pair.first
    @users = User.all
  end

  def show
    @pair = Pair.find(current_user.pair_id)
    @match = @pair.users
  end

  def create
    @pairs = Pair.all
    Pair.create_pairs
    redirect_to pairs_path, notice: "New Pairs Created!"
  end

end
