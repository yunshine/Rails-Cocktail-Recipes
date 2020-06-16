class Cocktail < ApplicationRecord
  has_one_attached :photo
  has_many :reviews, dependent: :destroy
  has_many :doses, dependent: :destroy
  has_many :ingredients, through: :doses
  validates :name, :description, :photo, presence: true
  validates :name, uniqueness: true
  include PgSearch::Model
  pg_search_scope :global_search,
    against: [ :name ],
    associated_against: {
      ingredient: [ :name ]
    },
    using: {
      tsearch: { prefix: true }
    }
end
