class Ingredient < ApplicationRecord
  has_many :doses
  has_many :cocktails, dependent: :doses
  validates :name, presence: true
  validates :name, uniqueness: true
end
