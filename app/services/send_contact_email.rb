require 'sendgrid-ruby'
include SendGrid

# pusher not working for now 

class SendContactEmail
    def initialize(leads)
        @leads = leads
    end
    def send_to_contact
        from = SendGrid::Email.new(email: 'rocketelevators.api@gmail.com')
        to = SendGrid::Email.new(email: @leads.email.to_s)
        subject = 'Rocket Elevators API'
        content = SendGrid::Content.new(type: 'text/plain', 
        value: "Greetings "+@leads.fullname.to_s+"\n\nWe thank you for contacting Rocket Elevators to discuss the opportunity to contribute your project "+@leads.projectname.to_s+"\n\nA representative from our team will be in touch with you very soon. We look forward to demonstrating the value of our solutions and help you choose the appropriate product given your requirements.\n\nWe’ll Talk soon\n\nThe Rocket Team")
        mail = SendGrid::Mail.new(from,subject,to,content)

        sg = SendGrid::API.new(api_key: "none")
        response = sg.client.mail._('send').post(request_body: mail.to_json)
        puts response.status_code
        puts response.body
        puts response.headers
    end
end


# require 'sendgrid-ruby'
# include SendGrid

# from = SendGrid::Email.new(email: 'rocketelevators.api@gmail.com')
# to = SendGrid::Email.new(email: 'test@example.com')
# subject = 'Sending with Twilio SendGrid is Fun'
# content = SendGrid::Content.new(type: 'text/plain', value: 'and easy to do anywhere, even with Ruby')
# mail = SendGrid::Mail.new(from, subject, to, content)

# sg = SendGrid::API.new(api_key: ENV['SENDGRID_API_KEY'])
# response = sg.client.mail._('send').post(request_body: mail.to_json)
# puts response.status_code
# puts response.body
# puts response.parsed_body
# puts response.headers


