class Subcategory < ApplicationRecord
  belongs_to :category
  has_many :markers
  validates :name, presence: true, uniqueness: true
  
  def to_s
    name
  end
  
end
