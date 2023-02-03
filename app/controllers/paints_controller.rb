class PaintsController < ApplicationController
  def index
    @paints = Paint.all
  end
end