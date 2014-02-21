class UsersController < ApplicationController
  def new
  end
  # GET /users/:id(.format)
  def show
    @user = User.find(params[:id])
  end
end
