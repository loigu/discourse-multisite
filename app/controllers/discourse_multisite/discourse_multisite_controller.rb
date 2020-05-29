module DiscourseMultisite
  class DiscourseMultisiteController < ::ApplicationController
    requires_plugin DiscourseMultisite

    before_action :ensure_logged_in

    def index
    end
  end
end
