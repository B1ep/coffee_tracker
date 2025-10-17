# Disable checksums for Cloudflare R2 compatibility
# R2 doesn't support multiple checksums at once
Rails.application.config.after_initialize do
  if Rails.application.config.active_storage.service == :amazon
    ActiveStorage::Blob.class_eval do
      def upload_without_unfurling(io)
        service.upload(key, io, checksum: nil)
      end
    end
  end
end
