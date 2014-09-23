# This file is used by Rack-based servers to start the application.

require ::File.expand_path('../config/environment',  __FILE__)
#use Rack::CanonicalHost, 'vintagecomputers.co.za'
run Rails.application
