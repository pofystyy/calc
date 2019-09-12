require_relative '../app'
require_relative 'application_controller'

class CalculatorController < ApplicationController
  include ErrorHandler

  before do
    response.headers['Access-Control-Allow-Origin'] = '*'
  end

  options "*" do
    response.headers["Allow"] = "POST, OPTIONS"
    response.headers["Access-Control-Allow-Headers"] = "Authorization, Content-Type, Accept, X-User-Email, X-Auth-Token"
  end

  post '/calculator/add' do
    raise ErrorHandler::InvalidBodyParams unless Calculator::BodyKeysValidator.call(params_)

    data = params_[:text]
    CalculationActions::Add.call(data)
  end
end
