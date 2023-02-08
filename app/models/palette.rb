class Palette < ApplicationRecord
  has_many :paints

  def paint_count
    paints.count
  end

  def paint_sort_alpha
    paints.order(paint_name: :ASC)
  end
end