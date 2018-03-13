module Refinery
  module Videos
    include ActiveSupport::Configurable

    config_accessor :dragonfly_secret, :dragonfly_url_format, :dragonfly_url_host, :dragonfly_verify_urls,
                    :max_file_size, :pages_per_dialog, :pages_per_admin_index,
                    :datastore_root_path,
                    :s3_backend, :s3_bucket_name, :s3_region,
                    :s3_access_key_id, :s3_secret_access_key,
                    :whitelisted_mime_types,
                    :custom_backend_class, :custom_backend_opts,
                    :skin_css_class


    self.dragonfly_secret = Refinery::Core.dragonfly_secret
    self.dragonfly_url_format = '/system/videos/:job/:basename.:format'
    self.dragonfly_url_host = ''
    self.dragonfly_verify_urls = true

    self.max_file_size = 524_288_000
    self.pages_per_dialog = 7
    self.pages_per_admin_index = 20
    self.whitelisted_mime_types = %w(video/mp4 video/x-flv application/ogg video/webm video/flv video/ogg)
    self.skin_css_class = "vjs-default-skin"

    class << self
      def datastore_root_path
        config.datastore_root_path || (Rails.root.join('public', 'system', 'refinery', 'videos').to_s if Rails.root)
      end

      def s3_backend
        config.s3_backend.presence || Core.s3_backend
      end

      def s3_bucket_name
        config.s3_bucket_name.presence || Core.s3_bucket_name
      end

      def s3_access_key_id
        config.s3_access_key_id.presence || Core.s3_access_key_id
      end

      def s3_secret_access_key
        config.s3_secret_access_key.presence || Core.s3_secret_access_key
      end

      def s3_root_path
        config.s3_root_path #|| Core.s3_root_path
      end

      def s3_region
        config.s3_region.presence || Core.s3_region
      end

      def custom_backend?
        config.custom_backend_class.presence || Core.dragonfly_custom_backend?
      end

      def custom_backend_class
        config.custom_backend_class.presence || Core.dragonfly_custom_backend_class
      end

      def custom_backend_opts
        config.custom_backend_opts.presence || Core.dragonfly_custom_backend_opts
      end
    end
  end
end
