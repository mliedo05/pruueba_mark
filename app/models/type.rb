class Type < ApplicationRecord
  belongs_to :marker

  def to_s
    name
  end
end
