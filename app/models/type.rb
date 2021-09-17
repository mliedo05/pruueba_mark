class Type < ApplicationRecord
  belongs_to :marker
  validates :name, presence: true
  def to_s
    name
  end
end
