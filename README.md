# Shortify

[![Build Status](https://travis-ci.org/shortify/shortify-ruby.svg?branch=master)](https://travis-ci.org/shortify/shortify-ruby)

A ruby client library for working with Shortify

## Installation

```ruby
gem "shortify"
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install shortify

## Usage

```ruby
def make_short_url(full_url)
  # assumes you're hosting your shortify instance at http://short.ly
  # for SSL, provide the scheme and host. E.g. https://short.ly
  client = Shortify::Client.new("short.ly", "username", "password")
  client.short_url_for(full_url)
rescue Shortify::Error => e
  # do something with the error
end
```

**Error Types**

* `Shortify::AuthenticationError` - bad credentials
* `Shortify::ParamsError` - bad url parameter
* `Shortify::Error` - anything else

## Development

After checking out the repo, run `bin/setup` to install dependencies.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release` to create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

1. Fork it ( https://github.com/[my-github-username]/shortify/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
