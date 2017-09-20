class PairsController < ApplicationController
  before_action :authorize_admin, only: :index

  def index
    @pairs = Pair.all
<<<<<<< HEAD
    @pair = Pair.first
=======
>>>>>>> af81a2f6e895e6a390d8abc38a309b9a69693a6c
    @users = User.all
  end

  def show
    @pair = Pair.find(current_user.pair_id)
    @users = @pair.users
  end


  def new
    @pair = Pair.new
    @users = User.all
    @pairs = Pair.all
  end
end
