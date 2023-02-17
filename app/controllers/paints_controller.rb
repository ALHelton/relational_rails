class PaintsController < ApplicationController
  def index
    @paints = Paint.true_opaque
  end

  def show
    @paint = Paint.find(params[:id])
  end

  def edit
    @paint = Paint.find(params[:id])
  end

  def update
    paint = Paint.find(params[:id])
    paint.update(paint_params)

    redirect_to "/paints/#{paint.id}"
  end

  def destroy
    paint = Paint.find(params[:id])
    paint.destroy
    redirect_to "/paints"
  end

  private

  def paint_params
    params.permit(:paint_name, :medium, :series, :opaque, :palette_id)
  end
end