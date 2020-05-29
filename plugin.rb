# frozen_string_literal: true

# name: discourse_multisite
# about: Allow proxying & multiple domains for single discourse instance.
# version: 0.1
# authors: Nanda Bhikkhu
# url: https://github.com/loigu

register_asset 'stylesheets/common/discourse-multisite.scss'
register_asset 'stylesheets/desktop/discourse-multisite.scss', :desktop
register_asset 'stylesheets/mobile/discourse-multisite.scss', :mobile

enabled_site_setting :discourse_multisite_enabled

PLUGIN_NAME ||= 'DiscourseMultisite'

load File.expand_path('lib/discourse-multisite/engine.rb', __dir__)

after_initialize do
#  Application.config.hosts.concat(SiteSettings.discourse_multisite_allowed_hostnames)
  class ::Middleware::EnforceHostname
    def call(env)
      requested_hostname = env[Rack::Request::HTTP_X_FORWARDED_HOST].presence || env[Rack::HTTP_HOST]
      allowed_hostnames = RailsMultisite::ConnectionManagement.current_db_hostnames + SiteSetting.discourse_multisite_allowed_hostnames
      
      env[Rack::Request::HTTP_X_FORWARDED_HOST] = nil
      env[Rack::HTTP_HOST] = allowed_hostnames.find { |h| h == requested_hostname } || Discourse.current_hostname
      
      @app.call(env)
    end
  end
end
