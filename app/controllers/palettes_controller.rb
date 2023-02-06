class PalettesController < ApplicationController
  
  def new
  end

  def index
    @palettes = Palette.all.order("created_at DESC")
  end

  def show
    @palette = Palette.find(params[:id])
  end

  def create
    Palette.create(palette_params)
    redirect_to '/palettes'
  end
  

  private

  def palette_params
    params.permit(:name, :brand, :cartridge_capacity, :recyclable)
  end
end