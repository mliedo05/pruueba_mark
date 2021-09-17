class Marker < ApplicationRecord
  belongs_to :subcategory
  has_many :types, dependent: :destroy
  validates :name, presence: true
end
