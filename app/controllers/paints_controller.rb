class PaintsController < ApplicationController
  def index
    @paints = Paint.all
  end

  def show
    @paint = Paint.find(params[:id])
  end
end