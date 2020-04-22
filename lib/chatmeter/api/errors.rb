module Chatmeter
  class API
    module Errors
      class Error < StandardError; end

      class ErrorWithResponse < Error
        attr_reader :response

        def initialize(message, response, backtrace)
          message = message << "\nbody: #{response.body.inspect}"
          super message
          set_backtrace(backtrace)
          @response = response
        end
      end

      class NotFound < ErrorWithResponse; end
      class BadRequest < ErrorWithResponse; end
      class Unauthorized < ErrorWithResponse; end
      class Forbidden < ErrorWithResponse; end
      class InternalServerError < ErrorWithResponse; end
      class RequestFailed < ErrorWithResponse; end
    end
  end
end
