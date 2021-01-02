class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user, only: [:show, :edit]

  def show
  end

  def edit
  end

  def create
  end

  private

  def set_user
    @user = User.find(params[:id])
  end
end
