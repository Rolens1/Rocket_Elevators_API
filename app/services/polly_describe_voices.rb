require 'aws-sdk-polly'
polly = Aws::Polly::Client.new
  # Get US English voices
resp = polly.describe_voices(language_code: 'en-US')

class PollyVoice    
    def initialize(region='us-east-1')
        @polly = Aws::Polly::Client.new(region: region)
    end
    def welcome        
        s3 = Aws::S3::Client.new(
        access_key_id: ENV["pusher_aws_access_key_id"]
        secret_access_key: ENV["pusher_aws_secret_access_key"]
        )
        
        puts  "allo-----------"
    end
end