require 'twilio-ruby'

class SmsCreator    
    def initialize(elevator)
        @elevator = elevator
    end
    def send_sms        
        message = "The Elevator with serial number: " +(@elevator.serial_number).to_s+" status has changed  to intervention"
        account_sid = ENV["pusher_app_id"]
        auth_token = ENV["pusher_key"]
        client = Twilio::REST::Client.new(account_sid, auth_token)
        from = '+19377293332' # Your Twilio number
        to =  @elevator.column.battery.building.phone_technical_contact.to_s
        client.messages.create(
        from: from,
        to: to,
        body: message
        )
        puts  "allo-----------"
    end
end


