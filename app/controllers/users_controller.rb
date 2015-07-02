class UsersController < ApplicationController
  def index
    @users = User.all
    ap params[:profile_type]
  end
end