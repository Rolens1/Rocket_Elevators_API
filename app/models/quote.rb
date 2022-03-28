class Quote < ApplicationRecord
    belongs_to :customer, optional: true
    
    after_save do |quote|
        SendTicket.new(quote).send_ticket_quotes
    end

end
