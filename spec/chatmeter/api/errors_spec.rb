require "spec_helper"

RSpec.describe Chatmeter::API::Errors::Unauthorized do
  context "Unauthorized" do
    it "creates an error with a message, response, and backtrace" do
      response_double = double(:response, {body: double(:body, {inspect: 'inspected body'})})

      unauthorized_error = Chatmeter::API::Errors::Unauthorized.new('error message', 
        response_double,
        "This is a backtrace\nStudy it well"
      )
      expect(unauthorized_error.response).to eq response_double
      expect(unauthorized_error.message).to eq "error message\nbody: inspected body"
      expect(unauthorized_error.backtrace.first).to eq "This is a backtrace\nStudy it well"
    end
  end
end

