class Review < ApplicationRecord
  belongs_to :cocktail
  validates :rating, :comment, presence: true
  validates :rating, numericality: true
  validates :rating, numericality: { only_integer: true }
  validates :rating, inclusion: { in: 0..10 }
end
