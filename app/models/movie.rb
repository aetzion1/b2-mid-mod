class Movie < ApplicationRecord
  belongs_to :studio
  has_and_belongs_to_many :actors
  has_many :movie_actors
  has_many :actors, through: :movie_actors
end
