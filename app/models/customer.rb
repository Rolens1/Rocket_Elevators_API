class Customer < ApplicationRecord
    belongs_to :user
    belongs_to :address
    has_many :buildings
    has_one :lead
    has_one :google_map

    after_create :dropbox_upload
    after_update :dropbox_upload

    def dropbox_upload
        client = DropboxApi::Client.new(ENV["dropbox_access_token"])
        leads = Leads.all
        leads.each do |lead|
            if lead.attachment.attached == true
                metadata = client.get_metadata("/#{lead.companyName}")
                folder = client.create_folder("/#{lead.companyName}")
                file_content = IO.read metadata.file_name
                client.upload("/#{folder}/#{lead.attachment.file_name}", file_content)
            end
        end
    end
end