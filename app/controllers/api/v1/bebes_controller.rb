class Api::V1::BebesController < ApplicationController

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
    @user = User.find_by_id(params[:user_id])
    @bebe = @user.bebes.new(bebe_params)

    if @user && @bebe.valid?
      set_default_image

      @bebe.save!
      bebe_json = BebeSerializer.new(@bebe).serialized_json
      render json: bebe_json
    else
      render json: @bebe.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /api/v1/bebes/1
  def update
    @bebe = Bebe.find_by_id(params[:id])

    if @bebe.update(bebe_params)
      set_default_image
      @bebe.save
      bebe_json = BebeSerializer.new(@bebe).serialized_json
      render json: bebe_json
    else
      render json: @bebe.errors, status: :unprocessable_entity
    end
  end

  # DELETE /api/v1/bebes/1
  def destroy
    @bebe = Bebe.find_by_id(params[:id])
    @bebe.destroy

    bebe_json = BebeSerializer.new(@bebe).serialized_json
    render json: bebe_json
  end

  private
    def set_default_image
      if @bebe.img === ""
        if @bebe.kind === "human"
          @bebe.img = "https://lh5.googleusercontent.com/proxy/utIR8FJt6xGYBIYhIkJOxvUJsQ8f0uzEKr2AAcUoZcCzE6gpwHrbbe9QuSn-cTcXSXXKnDeSDRVC8l4wRgNQn26wQ5a3UvPLHdgGP8wty_j2NKeU4qa1jF3JKAKLRUTHndMISCekbWIZxTsYyRmFncOMAJMhiVmtUT1l2Uhr4Q0Lo_4LSTTQ0G4MwhiQ0veJXOu0M1-yoJFs7OTLnJmiIfKR6i1MCZJK10cULkRl=s0-d"
        elsif @bebe.kind === "plant"
          @bebe.img = "https://images.vexels.com/media/users/3/148692/isolated/preview/4ff28c6516ef2c46843f69010116d898-flowerpot-with-plant-clipart-by-vexels.png"
        else
          @bebe.img = "https://webstockreview.net/images/clipart-dog-simple.png"
        end
      end
    end

    def bebe_params
      params.require(:bebe).permit(:name, :birthdate, :kind, :bio, :img)
    end
end
