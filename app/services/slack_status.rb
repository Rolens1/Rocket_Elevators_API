require 'slack-ruby-client'

class SlackStatus
    def initialize(elevator)
        @elevator = elevator
    end

    def send_status
        Slack.configure do |config|
            config.token = "no token"
        end
        
        client = Slack::Web::Client.new
        
        client.auth_test
        
        client.chat_postMessage(channel: '#elevator_operations', text: "Elevator ID: #{@elevator.id} with Serial Number : #{@elevator.serial_number}, changed status from : #{@elevator.status_was} to : #{@elevator.status}.", as_user: true)
    end

    
end
