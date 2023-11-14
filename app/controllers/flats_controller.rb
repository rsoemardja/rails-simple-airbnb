class FlatsController < ApplicationController
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
    @flat = Flat.new(params[:flat])

    if @flat.save
      redirect_to flats_path
    else
      render :new
    end
  end

  def edit
    @flat = Flat.find_by(id: params[:id])
  end

  def update
    @flat = Flat.find_by(id: params[:id])

    if @flat.update_attributes(params[:flat])
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
end
