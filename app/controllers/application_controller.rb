class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :people

  def current_user
    @current_user ||= Person.find(session[:person_id]) if session[:person_id]
  end
  helper_method :current_user

  def people
  @people = Person.all
  end
end
