class Actor < ApplicationRecord
    has_many :movie_actors
    has_and_belongs_to_many :movies
    has_many :movies, through: :movie_actors
end
