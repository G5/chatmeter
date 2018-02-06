require "spec_helper"

RSpec.describe Chatmeter do
  it "has a version number" do
    expect(Chatmeter::VERSION).not_to be nil
  end

  it "should return correct login response" do
    expect(Chatmeter.new).to be ""
  end
end
