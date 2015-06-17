require 'eventbrite_api_client/version'
require 'httparty'

class EventbriteApiClient
  include HTTParty
  base_uri 'https://www.eventbriteapi.com/v3'

  attr_reader :path

  def initialize(options)
    self.class.headers 'Authorization' => "Bearer #{options[:auth_token]}"

    @path = ""
  end

  def get(params = {})
    check_errors self.class.get(path, query: params)
  end

  def post(params = {})
    check_errors self.class.post(path, query: params)
  end

  def method_missing(method_sym, *args)
    them = self.dup

    them.path = "#{them.path}/#{method_sym.to_s}"
    them.path = "#{them.path}/#{args.first}" if args.first

    them
  end

  protected
    attr_writer :path

  private
    def check_errors(response)
      if !is_json?(response)
        {
          'error' => 'NOT_FOUND',
          'error_description' => 'That is not a valid api endpoitn',
          'status_code' => 404
        }
      else
        response
      end
    end

    def is_json?(response)
      response.respond_to?(:headers) && 
        response.headers['content-type'] == 'application/json'
    end
end
