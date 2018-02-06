require "chatmeter/version"
require "chatmeter/users"

module Chatmeter
  def initialize(root:, user:, secret:)
    @api_root, @username, @password = root, user, secret
  end

  def self.default_api
    @default_api ||= new(
      api_root: ENV['API_ROOT'],
      username: ENV['CHATMETER_ADMIN_USER'],
      password: ENV['CHATMETER_ADMIN_PASSWORD'])
    end
  end
