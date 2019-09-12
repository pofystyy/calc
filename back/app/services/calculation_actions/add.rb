require_relative '../../controllers/concerns/error_handler'
require_relative '../application_service'

module CalculationActions
  class Add < ApplicationService
    def initialize(data)
      @data = data
    end

    def call
      request = @data.split
      response = sum_for(request) if Calculator::BodyDataValidator.call(request)
      raise ErrorHandler::InvalidBodyParams unless response
      response.to_json
    end

    private

    def sum_for(request)
      request.map(&:to_f).sum
    end
  end
end
