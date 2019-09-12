require_relative './app/controllers/calculator_controller'

run Rack::URLMap.new('/' => CalculatorController)
