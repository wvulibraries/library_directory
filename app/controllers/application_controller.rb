class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  layout 'application'

  # concerns
  include Authenticatable
end
