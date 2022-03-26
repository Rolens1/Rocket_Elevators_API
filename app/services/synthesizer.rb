require 'aws-sdk-polly'
require 'base64'
polly = Aws::Polly::Client.new(region: 'us-east-2' )
class Synthesizer    
    def self.synthesize
      total_elevators = Elevator.count
      total_buildings = Building.count
      total_customers = Customer.count
      out_of_service = Elevator.where.not(status:'active').count
      total_quotes = Quote.count
      total_leads = Leads.count
      total_batteries = Battery.count
      total_cities = Address.distinct.count(:city)
    @polly = Aws::Polly::Client.new(region: 'us-east-2',access_key_id: ENV["pusher_aws_access_key_id"],secret_access_key: ENV["pusher_aws_secret_access_key"] )
      resp = @polly.synthesize_speech({
      text: "Welcome administrator. You have #{total_elevators.to_s} elevators deployed in #{total_buildings.to_s} building belonging to #{total_customers.to_s} customers. Currently there are #{out_of_service.to_s} elevators out of service and #{total_quotes.to_s} quotes waiting to be processed. There are also #{total_leads.to_s} leads waiting and #{total_batteries.to_s} batteries running across #{total_cities.to_s} cities",
      output_format: "mp3",
      voice_id: 'Joanna',
      text_type: "text" 
    })
    puts resp.audio_stream
    path = Rails.root / 'app' / 'assets' / 'audio' / 'output.mp3'
    IO.copy_stream(resp.audio_stream, path)
    end
end
