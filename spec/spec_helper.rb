# Configure Rails Envinronment
ENV["RAILS_ENV"] = "test"
spec_root = File.expand_path('..', __FILE__)
require File.expand_path("dummy/config/environment.rb",  spec_root)

require 'pry'
require 'rspec/rails'
require 'database_cleaner'
require 'shoulda-matchers'
require 'factory_girl_rspec'

# FactoryGirl.definition_file_paths = [File.join(spec_root, 'factories')]
# FactoryGirl.find_definitions

ENGINE_RAILS_ROOT=File.join(File.dirname(__FILE__), '../')

# Requires supporting ruby files with custom matchers and macros, etc,
# in spec/support/ and its subdirectories.
Dir[File.join(ENGINE_RAILS_ROOT, "spec/support/**/*.rb")].each {|f| require f }

RSpec.configure do |config|
  config.include FactoryGirl::Syntax::Methods
  config.include ModelAbstraction
  config.include Devise::TestHelpers, :type => :controller
  config.use_transactional_fixtures = false

  config.before(:suite) do
    DatabaseCleaner[:active_record].strategy = :deletion
    DatabaseCleaner.clean_with(:deletion)
  end

  config.before(:each) do
    DatabaseCleaner.start
  end

  config.after(:each) do
    DatabaseCleaner.clean
  end

  # enable rendering of views for controller tests
  # see http://stackoverflow.com/questions/4401539/rspec-2-how-to-render-views-by-default-for-all-controller-specs
  config.render_views
end

ActiveRecord::Migrator.migrate(File.expand_path("dummy/db/migrate/", spec_root))
