class FlatsController < ApplicationController
  before_action :set_flat, only: [:show, :edit, :update, :destroy]

  def index
    @flats = Flat.all
  end

  def show
    @flat = Flat.find_by(id: params[:id])
  end

  def new
    @flat = Flat.new
  end

  def create
    @flat = Flat.new(params[:flat].permit(:name, :address, :description, :price_per_night, :number_of_guests))
    @flat.save ? (redirect_to flat_path(@flat)) : (render :new, status: :unprocessable_entity)
  end

  def edit
    @flat = Flat.find_by(id: params[:id])
  end

  def update
    @flat = Flat.find_by(id: params[:id])

    if @flat.update_attribute(:name, params[:flat][:name])
      redirect_to flats_path
    else
      render :edit
    end
  end

  def destroy
    @flat = Flat.find_by(id: params[:id])
    @flat.destroy
    redirect_to flats_path
  end

  private

  def flat_params
    params.require(:flat).permit(:name, :address, :description, :price_per_night, :number_of_guests)
  end

  def set_flat
    @flat = Flat.find_by(id: params[:id])
  end
end
