# Load the Rails application.
require File.expand_path('../application', __FILE__)

# Initialize the Rails application.
SecretSanta::Application.initialize!

ActiveRecord::Base.pluralize_table_names = false