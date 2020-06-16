class Cocktail < ApplicationRecord

  include PgSearch::Model
  pg_search_scope :search_by_name,
    against: [ :name ],
    using: {
    tsearch: { prefix: true }
    }

  has_one_attached :photo
  has_many :reviews, dependent: :destroy
  has_many :doses, dependent: :destroy
  has_many :ingredients, through: :doses
  validates :name, :description, :photo, presence: true
  validates :name, uniqueness: true
  
end
