class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    # @place = @user.comments.place
  end
end
