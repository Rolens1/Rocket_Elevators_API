class Customer < ApplicationRecord

    belongs_to :user, optional: true
    belongs_to :address, optional: true
    has_many :buildings
    has_one :lead
    has_one :google_map

    after_create do |customer|
        dropbox_upload
    end

    after_update do |customer|
        dropbox_upload
    end



    def dropbox_upload
        client = DropboxApi::Client.new("sl.BEfqcEr17pQx6b0nFT_miKvRjNPOM4-nkqGsig0eaBnVJO3PTG3DRTAYqH4J3pRAESsCVCjBOlJUs1Mc_Jd_twlIUDBFZ0GKPyBOc65IoRVUzfbGG54eP1BRKb1kbVynpodqlAJk9uKo")
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