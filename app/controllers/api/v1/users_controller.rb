class Api::V1::UsersController < ApplicationController

  # POST api/v1/users
  def create
    @user = User.find_by(username: params[:username])

    if @user
      render json: {error: "Existing username. Are you trying to log in?"}, status: 400
    else
      @user = User.create(user_params)
      user_json = UserSerializer.new(@user).serialized_json
      render json: user_json, status: 200
    end
  end

  # POST api/v1/login
  def login
    @user = User.find_by(username: params[:username])

    if @user && @user.authenticate(params[:password])
      user_json = UserSerializer.new(@user).serialized_json
      render json: user_json, status: 200
    elsif @user
      render json: {error: "Failed to Authenticate. Please Try Again."}, status: 400
    else
      render json: {error: "Failed to Find User. Are you trying to register?"}, status: 400
    end
  end

  # GET api/v1/users/1
  def show
    render json: @user
  end

  # DELETE api/v1/users/1
  def destroy
    @user = User.find_by_id(params[:id])
    @user.destroy
    render json: {confirmation: "Your account was successfully deleted."}, status: 200
  end

  private
    # def set_user
    #   @user = User.find(params[:id])
    # end
    
    def user_params
      params.permit(:name, :username, :password)
    end
end
