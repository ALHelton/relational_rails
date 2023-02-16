class Paint < ApplicationRecord
  belongs_to :palette

  def self.true_opaque
    where("opaque" => "true")
  end

  def self.sort_alpha
    order(:paint_name)
  end
end