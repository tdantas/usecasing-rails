ENV["RAILS_ENV"] = "test"

require 'rails'
require "rails/generators/test_case"
require "aruba/api"
require 'generators/usecasing/usecasing_generator'

module RailsAppHelper
  include Aruba::Api

  def provisioning(app_name = 'usecasing_app')
    rails_new app_name

    cd "#{app_name}"

    write_file "Gemfile", <<-GEMFILE
      gem "rails"
      gem "usecasing-rails", path: "#{File.expand_path('../..', __FILE__)}"
    GEMFILE
    
    run_simple "bundle install"
  end

  def rails_generate_usecase(*params)
    run_simple "bundle exec rails generate usecasing #{params.join(" ")}"
  end

  def rails_new(app_name)
    cmd = "bundle exec rails new #{app_name} --skip-gemfile --skip-bundle --skip-git --skip-keeps --skip-active-record --skip-sprockets --skip-javascript --skip-test-unit --quiet"
    run_simple cmd
  end



end


class String
  def heredoc_strip
    new_indent = ( self.empty? ? 0 : ( scan(/^[ \t]*(?=\S)/).min.size ) )
    gsub(/^[ \t]{#{new_indent}}/, '').strip
  end
end

RSpec.configure do |config|
  config.treat_symbols_as_metadata_keys_with_true_values = true
  config.run_all_when_everything_filtered = true
  config.filter_run :focus
  config.order = 'random'
  
  config.include(RailsAppHelper)
  
  config.before do
    @aruba_timeout_seconds = 60
    FileUtils.rm_rf(current_dir)
  end

end
