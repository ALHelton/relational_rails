class Palette < ApplicationRecord
  has_many :paints

  def paint_count
    self.paints.count
  end
end