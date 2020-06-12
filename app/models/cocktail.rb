class Cocktail < ApplicationRecord
  has_many :reviews, dependent: :destroy
  has_many :doses, dependent: :destroy
  has_many :ingredients, through: :doses
  validates :name, :description, :photo, presence: true
  validates :name, uniqueness: true
end
