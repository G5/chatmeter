require "base64"
require "cgi"
require "excon"
require "securerandom"
require "uri"
require "multi_json"
require 'json'
require 'pry'

require "chatmeter/version"
require "chatmeter/api/user_management"
require "chatmeter/api/single_signon"
require "chatmeter/api/group"
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
      options = options.merge(:headers => HEADERS)

      if !@api_key && options.has_key?(:username) && options.has_key?(:password)
        username = options.delete(:username)
        password = options.delete(:password)
        @connection = Excon.new("#{options[:scheme]}://#{options[:host]}", options)
        @api_key = JSON.parse(self.post_login(username, password).body)["token"]
      end

      @connection = Excon.new("#{options[:scheme]}://#{options[:host]}", :headers => { Authorization: @api_key }, :mock => options[:mock])
    end

    def request(params, &block)

      params[:path] = "/#{OPTIONS[:api_version]}#{params[:path]}"

      begin
        response = @connection.request(params, &block)
      rescue Excon::Errors::HTTPStatusError => error
        puts error
      end

      @connection.reset
      response
    end
  end
end
