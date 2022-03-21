class Customer < ApplicationRecord
    belongs_to :user
    belongs_to :address
    has_many :buildings
    has_one :lead
end
