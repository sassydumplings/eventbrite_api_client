# EventbriteApiClient

A simple client for Eventbrite's v3 API. It's just a wrapper around
`HTTParty` and returns `HTTParty::Response`'s. The mechanism is pretty
generic and could easily be applied to any API.

## Installation

Add this line to your application's Gemfile:

    gem 'eventbrite_api_client'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install eventbrite_api_client

## Usage

```ruby
eb_api_client = EventbriteApiClient.new(auth_token: YOUR_TOKEN)
response = eb_api_client.events.search.get(q: 'Free Beer')

response = eb_api_client.users(1_000_000).owned_events.get()
```

## Contributing

1. Fork it ( http://github.com/<my-github-username>/eventbrite_api_client/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
