class Meble < ApplicationRecord
    has_many :article_categories
    has_many :categories, through: :article_categories
    belongs_to :user
    validates :nazwa, presence: true, length: {minimum:1, maximum:100}
    validates :rodzaj, presence: true, length: {minimum:1, maximum:100}
    validates :opis, presence: true, length: {minimum:1, maximum:100}
end