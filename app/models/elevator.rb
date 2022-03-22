
class Elevator < ApplicationRecord
    belongs_to :column
    after_update do |elevator|
        if self.status == 'intervention'
         SmsCreator.new(elevator).send_sms
        end  
    end
end    

