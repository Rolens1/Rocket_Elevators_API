class GoogleMap < ApplicationRecord
    belongs_to :customer, optional: true

    after_create do
        create_map
    end

end
