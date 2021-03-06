ENV['RAILS_ENV'] ||= 'test'
require_relative '../config/environment'
require 'rails/test_help'

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  include ApplicationHelper
  fixtures :all

  # Add more helper methods to be used by all tests here...

  def sign_in_as(user)
    cookies[:remember_token] = user.remember_token
  end
end
