
ENV['RAILS_ENV'] = 'test'
ENV['RAILS_ROOT'] ||= File.dirname(__FILE__) + '/../../../..'

require 'rubygems'
require 'test/unit'
require 'active_support/test_case'

require File.expand_path(File.join(ENV['RAILS_ROOT'], 'config/environment.rb')) 

#require File.join(Rails.root,'/rails/init') 

begin
  require 'ruby-debug'
  Debugger.start
  if Debugger.respond_to?(:settings)
    Debugger.settings[:autoeval] = true
    Debugger.settings[:autolist] = 1
  end
rescue LoadError
  puts 'The gem ruby-debug is not found'
end

#require File.dirname(__FILE__) + "/../lib/social_icons/view_helpers"