class Palette < ApplicationRecord
  has_many :paints

  def paint_count
    paints.count
  end
end