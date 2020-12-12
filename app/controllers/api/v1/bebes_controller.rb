class Api::V1::BebesController < ApplicationController
  before_action :set_api_v1_bebe, only: [:show, :update, :destroy]

  # GET /api/v1/bebes
  def index
    @api_v1_bebes = Api::V1::Bebe.all

    render json: @api_v1_bebes
  end

  # GET /api/v1/bebes/1
  def show
    render json: @api_v1_bebe
  end

  # POST /api/v1/bebes
  def create
    @api_v1_bebe = Api::V1::Bebe.new(api_v1_bebe_params)

    if @api_v1_bebe.save
      render json: @api_v1_bebe, status: :created, location: @api_v1_bebe
    else
      render json: @api_v1_bebe.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /api/v1/bebes/1
  def update
    if @api_v1_bebe.update(api_v1_bebe_params)
      render json: @api_v1_bebe
    else
      render json: @api_v1_bebe.errors, status: :unprocessable_entity
    end
  end

  # DELETE /api/v1/bebes/1
  def destroy
    @api_v1_bebe.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_api_v1_bebe
      @api_v1_bebe = Api::V1::Bebe.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def api_v1_bebe_params
      params.require(:api_v1_bebe).permit(:name, :birthdate, :kind, :bio)
    end
end
