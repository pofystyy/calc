module ErrorHandler
  class BaseCustomError < StandardError; end
  class InvalidBodyParams < BaseCustomError; end

  def self.included(klass)
    klass.class_eval do
      set :show_exceptions, false

      error InvalidBodyParams do |e|
        status 422
        content_type :json
        { status: :unprocessable_entity, message: 'Invalid body params' }.to_json
      end
    end
  end
end
