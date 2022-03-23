class Elevator < ApplicationRecord
    belongs_to :column
    has_many :google_map
end
