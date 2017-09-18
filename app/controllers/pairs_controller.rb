class PairsController < ApplicationController
  before_action :authorize_admin, only: :index

  def index
    @pairs = Pair.all
    @today_pairs = Pair.create_pairs_today
  end

  def show

  end

  def create
  end


end
