# Be sure to restart your server when you modify this file.

# ApplicationController.renderer.defaults.merge!(
#   http_host: 'example.org',
#   https: false
# )
config.action_dispatch.rescue_responses = {
  'ActionController::RoutingError'               => :not_found,
  'AbstractController::ActionNotFound'           => :not_found,
  'ActionController::MethodNotAllowed'           => :method_not_allowed,
  'ActionController::UnknownHttpMethod'          => :method_not_allowed,
  'ActionController::NotImplemented'             => :not_implemented,
  'ActionController::UnknownFormat'              => :not_acceptable,
  'ActionController::InvalidAuthenticityToken'   => :unprocessable_entity,
  'ActionController::InvalidCrossOriginRequest'  => :unprocessable_entity,
  'ActionDispatch::Http::Parameters::ParseError' => :bad_request,
  'ActionController::BadRequest'                 => :bad_request,
  'ActionController::ParameterMissing'           => :bad_request,
  'Rack::QueryParser::ParameterTypeError'        => :bad_request,
  'Rack::QueryParser::InvalidParameterError'     => :bad_request,
  'ActiveRecord::RecordNotFound'                 => :not_found,
  'ActiveRecord::StaleObjectError'               => :conflict,
  'ActiveRecord::RecordInvalid'                  => :unprocessable_entity,
  'ActiveRecord::RecordNotSaved'                 => :unprocessable_entity
}