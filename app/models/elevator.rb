
class Elevator < ApplicationRecord
    belongs_to :column
    has_many :google_map

    after_update do |elevator|
        if self.status == 'intervention'
         SmsCreator.new(elevator).send_sms
        end  
    end
    
end    

