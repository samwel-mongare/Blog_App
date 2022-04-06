source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.1.1'
gem 'bootsnap', require: false
gem 'importmap-rails'
gem 'jbuilder'
gem 'pg', '~> 1.1'
gem 'prettier', '~> 2.0'
gem 'puma', '~> 5.0'
gem 'rails', '~> 7.0.2', '>= 7.0.2.3'
gem 'rubocop', '>= 1.0', '< 2.0'
gem 'sprockets-rails'
gem 'stimulus-rails'
gem 'turbo-rails'
gem 'devise', '~> 4.8', '>= 4.8.1'
gem 'tzinfo-data'
group :development, :test do
  gem 'debug', platforms: %i[mri mingw x64_mingw]
  gem 'factory_bot_rails'
  gem 'rails-controller-testing'
  gem 'rspec-rails'
end
group :development do
  gem 'web-console'
end

group :test do
  gem 'capybara'
  gem 'faker', git: 'https://github.com/stympy/faker.git', branch: 'master'
  gem 'ffi', '~> 1.15', '>= 1.15.5'
  gem 'selenium-webdriver'
  gem 'shoulda-matchers'
  gem 'webdrivers'
end
