class SendTicket
    def initialize(req)
        @leads = req
        @quote = req
    end

    def send_ticket_contact
      require 'net/http'
      require 'uri'
      require 'json'

      uri = URI.parse("https://rocketelevators-twr.freshdesk.com/api/v2/tickets")
      request = Net::HTTP::Post.new(uri)
      request.basic_auth(ENV["pusher_ticket_api"] , "X")
      request.content_type = "application/json"
      msg = "The contact " + @leads.fullname.to_s + " from company "+ @leads.companyname.to_s+ " can be reached at email "+ @leads.email.to_s+ "and at a phone number " + @leads.phone.to_s+". "+@leads.departmentincharge.to_s+ "has a project named "+@leads.projectname.to_s+" wich require contribution from Rokcet Elevatos \n" + @leads.projectdescription.to_s+ "\n"+@leads.question.to_s+ "\n"+"The Contact uploaded an attachment"
      request.body = JSON.dump({
        "description" => msg,
        "subject" => @leads.fullname.to_s + " from " + @leads.companyname,
        "email" => @quote.email.to_s,
        "priority" => 1,
        "status" => 2,
      })

      req_options = {
        use_ssl: uri.scheme == "https",
      }

      response = Net::HTTP.start(uri.hostname, uri.port, req_options) do |http|
        http.request(request)
      end

    end
    def send_ticket_quotes
      require 'net/http'
      require 'uri'
      require 'json'

      uri = URI.parse("https://rocketelevators-twr.freshdesk.com/api/v2/tickets")
      request = Net::HTTP::Post.new(uri)
      request.basic_auth(ENV["pusher_ticket_api"], "X")
      request.content_type = "application/json"
      msg = "Quote Form The contact " + 
      # @quote.full_name_company_contact.to_s + 
      " from company " + @leads.companyname.to_s + 
      " can be reached at email "+ @leads.email.to_s + 
      "and at a phone number " + 
      # @leads.phone.to_s 
      + ". " +
      # @leads.departmentincharge.to_s 
      + "has a project named " + 
      # @leads.projectname.to_s 
      + " which require contribution from Rokcet Elevators \n" + 
      # @leads.projectdescription.to_s 
      + "\n" + 
      # @leads.question.to_s
      + "\n" + "The Contact uploaded an attachment"
      request.body = JSON.dump({
        "description" => msg,
        "subject" => @leads.companyname.to_s,
        "email" => @leads.email.to_s,
        "priority" => 1,
        "status" => 2,
      })

      req_options = {
        use_ssl: uri.scheme == "https",
      }

      response = Net::HTTP.start(uri.hostname, uri.port, req_options) do |http|
        http.request(request)
      end

    end
end

# response.code
# response.body