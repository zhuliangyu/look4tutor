# Load the Rails application.
require File.expand_path('../application', __FILE__)

require 'will_paginate'


# Initialize the Rails application.
Rails.application.initialize!

config.action_mailer.default_url_options = { :host => 'look4tutor.heroku.com' }

