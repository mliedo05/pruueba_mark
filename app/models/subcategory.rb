class Subcategory < ApplicationRecord
  belongs_to :category
  has_many :markers
  
  def to_s
    name
  end
  
end
