class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @places = @user.places.order("name").page(params[:page]).per_page(4)
  end
end
