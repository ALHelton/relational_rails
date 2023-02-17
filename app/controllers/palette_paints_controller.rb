class PalettePaintsController < ApplicationController
  def index
    @palette = Palette.find(params[:id])
    if params[:sort] == "alphabetical"
      @paints = @palette.paints.sort_alpha
    elsif params[:series]
      @paints = @palette.paints.series_filter(params[:series])
    else
      @paints = @palette.paints
    end
  end

  def new
    @palette = Palette.find(params[:id])
  end

  def create
    palette = Palette.find(params[:id])
    
    palette.paints.create!(paint_params)

    redirect_to "/palettes/#{palette.id}/paints"
  end

  private
  def paint_params
    params.permit(:paint_name, :medium, :series, :opaque)
  end
end