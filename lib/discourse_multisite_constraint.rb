class DiscourseMultisiteConstraint
  def matches?(request)
    SiteSetting.discourse_multisite_enabled
  end
end
