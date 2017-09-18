class PagesController < ApplicationController
  def home
    @users = User.all
    @pairs = Pair.all
  end
end
