require File.expand_path('../../lib/better_puts', __FILE__)

bp "testin something" do
  bp "this is nested"
end

bp # empty should work