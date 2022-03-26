class DropboxController < ApplicationController

#   # Example call:
#   # GET /dropbox/authorize
  def authorize
    client_id = ENV['dropbox_client_id']
    client_secret = ENV['dropbox_client_secret']
    redirect_uri = 'http://localhost:3000/dropbox/authorize_callback'

    url = "https://www.dropbox.com/oauth2/authorize?client_id=4tbznw39ccn6mdb&redirect_uri=#{redirect_uri}&response_type=code"
    redirect_to url
  end

  def authorize_callback
    redirect_to index_path
  end
end
