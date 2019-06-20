class ApplicationController < ActionController::Base
  include SessionsHelper

  def current_user=(user)
    @current_user = user
  end

  helper_method :current_user
end
