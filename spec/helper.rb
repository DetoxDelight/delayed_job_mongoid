require 'simplecov'
require 'coveralls'

SimpleCov.formatter = SimpleCov::Formatter::MultiFormatter[
  SimpleCov::Formatter::HTMLFormatter,
  Coveralls::SimpleCov::Formatter
]

SimpleCov.start do
  add_filter '/spec/'
  minimum_coverage(77.27)
end

require 'rspec'
require 'delayed_job_mongoid'
require 'delayed/backend/shared_spec'

RSpec.configure do |config|
  config.expect_with :rspec do |c|
    c.syntax = :expect
  end
end

Mongoid.configure do |config|
  config.connect_to('dl_spec')
end

class Story
  include ::Mongoid::Document
  field :text

  def tell
    text
  end

  def whatever(n, _)
    tell * n
  end
  def self.count; end

  handle_asynchronously :whatever
end
