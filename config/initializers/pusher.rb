# config/initializers/pusher.rb
Pusher.app_id = ENV["pusher_app_id"]
Pusher.key    = ENV["pusher_key"]
# Pusher.secret = ENV["pusher_secret"]

Pusher.sendgrid_api = ENV["pusher_sendgrid_api"]
Pusher.ticket_uri = ENV["pusher_ticket_uri"]
Pusher.ticket_api = ENV["pusher_ticket_api"]
Pusher.slack_api = ENV["pusher_slack_api"]
