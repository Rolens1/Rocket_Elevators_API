class Customer < ApplicationRecord

    belongs_to :user, optional: true
    belongs_to :address, optional: true
    has_many :buildings
    has_one :lead
    has_one :google_map
    has_many :quotes

    after_create do |customer|
        dropbox_upload
    end

    after_update do |customer|
        dropbox_upload
    end

    def dropbox_upload
        client = DropboxApi::Client.new("sl.BEea3dYcFuP_mmC2zbry1VZd8Ck_V0u-NuQlvJ6CHElNHKuxFV0lYdjQHz4k8o3uuHsIs8HiYpQbWpM9SWMM7fWxptrmZxZ1RuI_iNUtytjUJRnnRa_QBKyUDUGuYB7NINdhKQqnCS1a")
        leads = Leads.all
        leads.each do |lead|
            if lead.attachment
                file_name = lead.attachment.filename
                file_content = lead.attachment.blob.download
                puts "@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@"
                puts lead.attachment
                client.upload("/#{lead.companyname}/#{lead.attachment.filename}", file_content)
                lead.destroy
            end
        end
    end
end