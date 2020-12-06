class Api::V1::UsersController < ApplicationController
  # before_action :set_user, only: [:show, :update, :destroy]

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
      render json: {error: "Failed to Authenticate"}, status: 400
    else
      render json: {error: "Failed to Find User"}, status: 400
    end
  end

  # GET api/v1/users/1
  def show
    render json: @user
  end

  # PATCH/PUT api/v1/users/1
  def update
    if @user.update(user_params)
      render json: @user
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  # DELETE api/v1/users/1
  def destroy
    @user.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def user_params
      params.permit(:name, :username, :password)
    end
end
