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
        client = DropboxApi::Client.new("sl.BEZiYvWcCNLu5ZteZpssYGdcnDOR3GnYD1ZIUqHw5dsO1ovLLxLE0jRUf-wp5w0W6Gsekeo7xDKu-4Q2uSwCPfDE-A0OWJcMxsMc-6uazd0gEoIB8lpZmSe7Gi22fG9TFxRE42o1r5RH")
        leads = Leads.all
        leads.each do |lead|
            if lead.attachment
                file_name = lead.attachment.filename
                file_content = lead.attachment.blob.download
                puts "@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@"
                puts lead.attachment
                client.upload("/#{lead.companyname}/#{lead.attachment.filename}", file_content)
            end
        end
    end
end