class Cocktail < ApplicationRecord
  has_many :reviews, dependent: :destroy
  has_many :doses
end
