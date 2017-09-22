class PairsController < ApplicationController

  def index
    @pairs = Pair.all
    @users = User.all
  end

  def show
    @pairs = Pair.where(student1: current_user.full_name).or(Pair.where(student2: current_user.full_name))
    @pair = Pair.find(current_user.pair_id)
    @match = @pair.users
  end

  def create
    @pairs = Pair.all
    Pair.create_pairs
    redirect_to pairs_path, notice: "New Pairs Created!"
  end
end
