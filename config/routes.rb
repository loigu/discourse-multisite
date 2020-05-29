require_dependency "discourse_multisite_constraint"

DiscourseMultisite::Engine.routes.draw do
  get "/" => "discourse_multisite#index", constraints: DiscourseMultisiteConstraint.new
  get "/actions" => "actions#index", constraints: DiscourseMultisiteConstraint.new
  get "/actions/:id" => "actions#show", constraints: DiscourseMultisiteConstraint.new
end
