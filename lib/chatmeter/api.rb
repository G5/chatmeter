require "base64"
require "cgi"
require "excon"
require "securerandom"
require "uri"
require "multi_json"
require 'json'

require "chatmeter/version"
require "chatmeter/api/errors"
require "chatmeter/api/user_management"
require "chatmeter/api/single_signon"
require "chatmeter/api/group"
require "chatmeter/api/account"
require "chatmeter/api/location"
require "chatmeter/api/review"
require "chatmeter/api/user_group_access"
require "chatmeter/api/user_location_access"
require "chatmeter/api/login"
require "chatmeter/api/campaign"
require "chatmeter/api/competitors"
require "chatmeter/api/listings"
require "chatmeter/api/mock"
require "chatmeter/api/errors"
require "chatmeter/api/email"
require "chatmeter/api/form"

module Chatmeter
  class API

    HEADERS = {
      'Accept':          'application/json',
      'Content-Type':    'application/json'
    }

    OPTIONS = {
      headers:     {},
      host:        ENV['CHATMETER_API_ROOT'] || "live.chatmeter.com",
      username:    ENV['CHATMETER_ADMIN_USER'],
      password:    ENV['CHATMETER_ADMIN_PASSWORD'],
      scheme:      'https',
      api_version: 'v5',
      mock: false
    }
    attr_accessor :api_key

    def initialize(options={})
      options = OPTIONS.merge(options)
      options = options.merge(headers: HEADERS)
      @headers = {}

      if !api_key && options.has_key?(:username) && options.has_key?(:password) && options[:mock] == false
        @username = options.delete(:username)
        @password = options.delete(:password)
        @connection = Excon.new("#{options[:scheme]}://#{options[:host]}", options)
        get_api_token
      end
      @connection = Excon.new("#{options[:scheme]}://#{options[:host]}", headers: @headers, mock: options[:mock])
    end

    def get_api_token
      self.api_key = post_login(@username, @password)[:token]
      @headers = HEADERS.merge({ Authorization: api_key })
    end

    def request(params, &block)
      original_path = params[:path]
      params[:path] = "/#{OPTIONS[:api_version]}#{params[:path]}"
      begin
        response = @connection.request(params, &block)
      rescue Excon::Errors::HTTPStatusError => error
        klass = case error.response.status.to_s
        when '400' then Chatmeter::API::Errors::BadRequest
        when '401' then Chatmeter::API::Errors::Unauthorized
        when '403' then Chatmeter::API::Errors::Forbidden
        when '404' then Chatmeter::API::Errors::NotFound
        when /50./ then Chatmeter::API::Errors::RequestFailed
        else Chatmeter::API::Errors::ErrorWithResponse
        end

        if klass == Chatmeter::API::Errors::Unauthorized
          get_api_token
          params[:path] = original_path
          return request(params, &block)
        else
          reerror = klass.new(error.message, error.response, error.backtrace)
          raise(reerror)
        end

      end

      if response.body && !response.body.empty?
        begin
          response_body = MultiJson.load(response.body, symbolize_keys: true)
        rescue
          if response.headers['Content-Type'] === 'application/json'
            raise
          end
          response_body = response.body
          # leave non-JSON body as is
        end
      end

      @connection.reset
      response_body || ""
    end
  end
end
