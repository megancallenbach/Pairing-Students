class PairsController < ApplicationController

  def index
    @pairs = Pair.all
    @pair = Pair.first
    @users = User.all
  end

  def show
    @pairs = Pair.where(student1: current_user.full_name).find_each
    @pair = Pair.find(current_user.pair_id)
    @match = @pair.users
  end

  def create
    @pairs = Pair.all
    Pair.create_pairs
    redirect_to pairs_path, notice: "New Pairs Created!"
  end

  def destroy
    # @pairs = Pair.all
    Pair.find_each(&:destroy)
    redirect_to pairs_path, notice: "All Pairs Deleted!"
  end

# Post.select('DISTINCT created_at').order('created_at DESC').limit(5).pluck(:created_at)

end
