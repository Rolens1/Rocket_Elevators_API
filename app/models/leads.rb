class Leads < ApplicationRecord
    attr_accessor :remove_attachment
    has_one_attached :attachment

    belongs_to :customer, optional: true
    
end
