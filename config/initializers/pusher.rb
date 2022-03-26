# Add configuration values here, as shown below.
#
# pusher_app_id: "2954"
# pusher_key: 7381a978f7dd7f9a1117
# pusher_secret: abdc3b896a0ffb85d373
# stripe_api_key: sk_test_2J0l093xOyW72XUYJHE4Dv2r
# stripe_publishable_key: pk_test_ro9jV5SNwGb1yYlQfzG17LHK
#
# production:
#   stripe_api_key: sk_live_EeHnL644i6zo4Iyq4v1KdV9H
#   stripe_publishable_key: pk_live_9lcthxpSIHbGwmdO941O1XVU

#google
pusher_google_app_key: ENV['pusher_google_app_key']
#dropbox
pusher_dropbox_client_id: ENV['pusher_dropbox_client_id']
pusher_dropbox_client_secret: ENV['pusher_dropbox_client_secret']
#twilio
pusher_twilio_app_id: ENV['pusher_twilio_app_id']
pusher_twilio_key: ENV['pusher_twilio_key']
#polly
pusher_aws_access_key_id: ENV['pusher_aws_access_key_id']
pusher_aws_secret_access_key: ENV['pusher_aws_secret_access_key']
#sendgrid
pusher_sendgrid_api: ENV['pusher_sendgrid_api']
#freshdesk
pusher_ticket_uri: ENV['pusher_ticket_uri']
pusher_ticket_api: ENV['pusher_ticket_api']
#slack
pusher_slack_api: ENV['pusher_slack_api']


production:
    #google
    pusher_google_app_key: ENV['pusher_google_app_key']
    #dropbox
    pusher_dropbox_client_id: ENV['pusher_dropbox_client_id']
    pusher_dropbox_client_secret: ENV['pusher_dropbox_client_secret']
    #twilio
    pusher_twilio_app_id: ENV['pusher_twilio_app_id']
    pusher_twilio_key: ENV['pusher_twilio_key']
    #polly
    pusher_aws_access_key_id: ENV['pusher_aws_access_key_id']
    pusher_aws_secret_access_key: ENV['pusher_aws_secret_access_key']
    #sendgrid
    pusher_sendgrid_api: ENV['pusher_sendgrid_api']
    #freshdesk
    pusher_ticket_uri: ENV['pusher_ticket_uri']
    pusher_ticket_api: ENV['pusher_ticket_api']
    #slack
    pusher_slack_api: ENV['pusher_slack_api']