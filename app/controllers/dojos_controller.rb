class DojosController < ApplicationController
  before_action :set_dojo, only: [:show, :update, :destroy]

  # GET /dojos
  def index
    @dojos = Dojo.all

    render json: @dojos,only:["nombre"]
  end

  # GET /dojos/1
  def show
    render json: @dojo, only:["descripcion"]
  end

  # POST /dojos
  def create
    @dojo = Dojo.new(dojo_params)

    if @dojo.save
      render json: @dojo, status: :created, location: @dojo
    else
      render json: @dojo.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /dojos/1
  def update
    if @dojo.update(dojo_params)
      render json: @dojo
    else
      render json: @dojo.errors, status: :unprocessable_entity
    end
  end

  # DELETE /dojos/1
  def destroy
    @dojo.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_dojo
      @dojo = Dojo.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def dojo_params
      params.require(:dojo).permit(:nombre, :descripcion)
    end
end
