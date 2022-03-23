class DropboxController < ApplicationController

#   # Example call:
#   # GET /dropbox/auth
#   def auth
#     client_id = '4tbznw39ccn6mdb'
#     client_secret = 'g7fioaudemuh7gk'
#     redirect_uri = 'http://localhost:3000/dropbox/auth_callback'

#     authenticator = DropboxApi::Authenticator.new(client_id, client_secret)
#     url = "https://www.dropbox.com/oauth2/authorize?client_id=#{client_id}&redirect_uri=#{redirect_uri}&response_type=code"
#     redirect_to url
#   end

#   # Example call:
#   # GET /dropbox/auth_callback?code=VofXAX8DO1sAAAAAAAACUKBwkDZyMg1zKT0f_FNONeA
#   def auth_callback
#     access_token = authenticator.auth_code.get_token(:code)
#     access_token.token # This line is step 5 in the diagram.

#     # At this stage you may want to persist the reusable token we've acquired.
#     # Remember that it's bound to the Dropbox account of your user.

#     # If you persist this token, you can use it in subsequent requests or
#     # background jobs to perform calls to Dropbox API such as the following.
#     folders = DropboxApi::Client.new(token).list_folder "/"
#   end

#   def redirect_uri
#     dropbox_auth_callback_url # => http://localhost:3000/dropbox/auth_callback
#   end
# end

    # Example call:
    # GET /dropbox/auth
    def authorize
      url = authenticator.authorize_url :redirect_uri => redirect_uri
  
      redirect_to url
    end
  end
