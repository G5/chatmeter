require "base64"
require "cgi"
require "excon"
require "securerandom"
require "uri"
require "multi_json"
require 'json'

require "chatmeter/version"
require "chatmeter/api/user_management"
require "chatmeter/api/login"
require "chatmeter/api/mock"

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

      if !@api_key && options.has_key?(:username) && options.has_key?(:password)
        username = options.delete(:username)
        password = options.delete(:password)
        @connection = Excon.new("#{options[:scheme]}://#{options[:host]}/#{options[:api_version]}", options.merge(:headers => HEADERS))
        @api_key = self.post_login(username, password).body[:token]
      end

      user_pass = ":#{@api_key}"
      options[:headers] = HEADERS.merge({'Authorization' => "Basic #{Base64.encode64(user_pass).gsub("\n", '')}"}).merge(options[:headers])

      @connection = Excon.new("#{options[:scheme]}://#{options[:host]}", options)
    end

    def request(params, &block)
      begin
        response = @connection.request(params, &block)
      rescue Excon::Errors::HTTPStatusError => error
      end

      @connection.reset
      response
    end
  end
end
