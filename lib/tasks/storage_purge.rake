namespace :purge do
    task :doit do
        ActiveStorage::Blob.left_joins(:attachments).where(active_storage_attachments: { id: nil }).find_each(&:purge)
    end
end