class UsersController < ApplicationController
  before_action :authorize_admin, only: :index

  def index
    @users = User.all
  end

end
