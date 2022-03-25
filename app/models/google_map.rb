class GoogleMap < ApplicationRecord
    belongs_to :customer, optional: true
end
