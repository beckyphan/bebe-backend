class Api::V1::BebesController < ApplicationController
  # before_action :set_bebe, only: [:show, :update, :destroy]

  # GET /api/v1/users/:id/bebes
  def index
    @user = User.find_by_id(params[:user_id])
    @bebes = @user.bebes

    bebes_json = BebeSerializer.new(@bebes).serialized_json
    render json: bebes_json
  end

  # GET /api/v1/users/:id/bebes/:id
  def show
    @bebe = Bebe.find_by_id(params[:id])

    bebe_json = BebeSerializer.new(@bebe).serialized_json
    render json: bebe_json
  end

  # POST /api/v1/user/:id/bebes
  def create
    @bebe = Bebe.new(bebe_params)
    @user = User.find_by_id(params[:user_id])

    if @user && @user.bebes.new(bebe_params)
      @user.bebes.create(bebe_params)
      bebe_json = BebeSerializer.new(@bebe).serialized_json
      render json: bebe_json
    else
      render json: @bebe.errors, status: :unprocessable_entity
    end
  end
  #
  # PATCH/PUT /api/v1/bebes/1
  # def update
  #   binding.pry
  #   if @bebe.update(bebe_params)
  #     bebe_json = BebeSerializer.new(@bebe).serialized_json
  #     render json: bebe_json
  #   else
  #     render json: @bebe.errors, status: :unprocessable_entity
  #   end
  # end
  #
  # # DELETE /api/v1/bebes/1
  def destroy
    @bebe = Bebe.find_by_id(params[:id])
    @bebe.destroy
    
    bebe_json = BebeSerializer.new(@bebe).serialized_json
    render json: bebe_json
  end

  private
    # # Use callbacks to share common setup or constraints between actions.
    # def set_bebe
    #   @bebe = Bebe.find(params[:id])
    # end

    # Only allow a trusted parameter "white list" through.
    def bebe_params
      params.require(:bebe).permit(:name, :birthdate, :kind, :bio, :img)
    end
end
