class Paint < ApplicationRecord
  belongs_to :palette

  def self.true_opaque
    self.where("opaque" => "true")
  end
end