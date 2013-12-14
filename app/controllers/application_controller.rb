class ApplicationController < ActionController::Base
  include Concerns::AuthHelper

  protect_from_forgery with: :exception
end
