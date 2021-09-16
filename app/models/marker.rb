class Marker < ApplicationRecord
  belongs_to :subcategory
  has_many :types, dependent: :destroy
end
