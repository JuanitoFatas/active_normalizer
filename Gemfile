source "https://rubygems.org"

git_source(:github) {|repo_name| "https://github.com/#{repo_name}" }

# Specify your gem's dependencies in active_normalizer.gemspec
gemspec


group :development do
  gem "bundler", "~> 1.0"
  gem "rake", "~> 10.0"
  gem "rspec", "~> 3.7"
  gem "pry"
  gem "benchmark-ips"
end

group :test do
  gem "unf"
  gem "unicode"
  gem "unicode_utils"
  gem "activesupport"
end
