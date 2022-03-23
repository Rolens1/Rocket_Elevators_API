class Leads < ApplicationRecord
    attr_accessor :remove_attachment
    has_one_attached :attachment

    after_save do |leads|
        SendContactEmail.new(leads).send_to_contact
    end
end
