ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all

  def is_logged_in?
    !session[:player_id].nil?
  end

  def log_in_as(player, options = {})
    password = options[:password] || 'password'
    remember_me = options[:remember_me] || '1'

    if integration_test?
      post login_path, session: { email: player.email, password: password, remember_me: remember_me }
    else
      session[:player_id] = player_id
    end
  end

  private

    def integration_test?
      defined?(post_via_redirect)
    end
end
