require "bundler/setup"
require "rack/test"
require "capybara/cucumber"

require_relative "../../pickme"

require "minitest/autorun"
require 'capybara_minitest_spec'
World(MiniTest::Assertions)
MiniTest::Spec.new(nil)

Capybara.app = Sinatra::Application
