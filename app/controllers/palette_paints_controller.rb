class PalettePaintsController < ApplicationController
  def index
    @palette = Palette.find(params[:id])
    @paints = @palette.paints
  end

  def new
    @palette = Palette.find(params[:id])
  end

  def create
    palette = Palette.find(params[:id])
    paint = palette.paints.create!(paint_params)

    redirect_to "/palettes/#{palette.id}/paints"
  end

  private
  def paint_params
    params.permit(:paint_name, :medium, :series, :opaque)
  end
end