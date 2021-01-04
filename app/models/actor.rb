class Actor < ApplicationRecord
    has_many :casts
    has_many :movies, through: :casts

    scope :sort_by_age, lambda {order("age ASC")}
    scope :avg_age, lambda {average("age")}
end
