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
require "chatmeter/api/contact"
require "chatmeter/api/mock"
require "chatmeter/api/errors"

module Chatmeter
  class API

    HEADERS = {
      'Accept-Encoding': 'gzip',
      'Accept':          'application/json',
      'Content-Type':    'application/json'
    }

    OPTIONS = {
      headers:     {},
      host:        ENV['CHATMETER_API_ROOT'] || "live.chatmeter.com",
      username:    ENV['CHATMETER_ADMIN_USER'],
      password:    ENV['CHATMETER_ADMIN_PASSWORD'],
      scheme:      'https',
      api_version: 'v5'
    }

    def initialize(options={})
      options = OPTIONS.merge(options)
      options = options.merge(headers: HEADERS)

      if !@api_key && options.has_key?(:username) && options.has_key?(:password)
        username = options.delete(:username)
        password = options.delete(:password)
        @connection = Excon.new("#{options[:scheme]}://#{options[:host]}", options)
        @api_key = self.post_login(username, password)[:token]
      end

      headers = HEADERS.merge({ Authorization: @api_key })
      @connection = Excon.new("#{options[:scheme]}://#{options[:host]}", headers: headers, mock: options[:mock])
    end

    def request(params, &block)
      params[:path] = "/#{OPTIONS[:api_version]}#{params[:path]}"

      begin
        response = @connection.request(params, &block)
      rescue Excon::Errors::HTTPStatusError => error
        klass = case error.response.status
        when 400 then Chatmeter::API::Errors::BadRequest
        when 401 then Chatmeter::API::Errors::Unauthorized
        when 403 then Chatmeter::API::Errors::Forbidden
        when 404 then Chatmeter::API::Errors::NotFound
        when /50./ then Chatmeter::API::Errors::RequestFailed
        else Chatmeter::API::Errors::ErrorWithResponse
        end

        reerror = klass.new(error.message, error.response)
        reerror.set_backtrace(error.backtrace)
        raise(reerror)
      end

      if response.body && !response.body.empty?
        begin
          response.body = MultiJson.load(response.body, symbolize_keys: true)
        rescue
          if response.headers['Content-Type'] === 'application/json'
            raise
          end
          # leave non-JSON body as is
        end
      end

      @connection.reset
      response.body || ""
    end
  end
end
