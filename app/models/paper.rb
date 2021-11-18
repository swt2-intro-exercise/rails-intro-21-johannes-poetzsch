class Paper < ApplicationRecord
    has_and_belongs_to_many :authors
    validates :title, presence: true
    validates :venue, presence: true
    validates :year, presence: true, numericality: { only_integer: true }
    
    scope :published_in, ->(searched_year) { where("year = ?", searched_year) if searched_year.present? } 
    
end
