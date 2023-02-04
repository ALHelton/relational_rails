class PalettePaintsController < ApplicationController
  def index
    @palette = Palette.find(params[:id])
    @paints = @palette.paints
  end
end