class Leads < ApplicationRecord
    attr_accessor :remove_attachment
    has_one_attached :attachment

    belongs_to :customer, optional: true

    # def dropbox_upload
    #     client = DropboxApi::Client.new ENV["dropbox_client_id"]
    #     leads = Leads.new
    #     leads.each do |lead|
    #     if lead.attachment == true
    #         company_name = client.get_metadata("/#{lead.company_name}") 
    #         client.create_folder("/#{lead.company_name}")
    #         client.upload("/#{l.company_name}/#{file_name}", file_content)
    #     end
    # end
    
end
