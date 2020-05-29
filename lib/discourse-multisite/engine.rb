module DiscourseMultisite
  class Engine < ::Rails::Engine
    engine_name "DiscourseMultisite".freeze
    isolate_namespace DiscourseMultisite

    config.after_initialize do
      Discourse::Application.routes.append do
        mount ::DiscourseMultisite::Engine, at: "/discourse-multisite"
      end
    end
  end
end
