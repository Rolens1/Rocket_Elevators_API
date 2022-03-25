class Leads < ApplicationRecord
    attr_accessor :remove_attachment
    has_one_attached :attachment

    after_save do |leads|
        SendTicket.new(leads).send_ticket_contact
    end
end
