class PalettesController < ApplicationController
  def index
    @palettes = Palette.all.order("created_at DESC")
  end

  def show
    @palette = Palette.find(params[:id])
  end
end