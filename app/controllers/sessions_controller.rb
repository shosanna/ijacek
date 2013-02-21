class SessionsController < ApplicationController

  def new

  end

  def create
    person = Person.find_by_username(params[:username])

    if person && person.authenticate(params[:password])
      session[:person_id] = person.id
      redirect_to entries_path
    else
      flash[:notice] = "Sorry, you are not Ijacek"
      redirect_to root_path
    end
  end

  def destroy
    session[:person_id] = nil
    flash[:notice] = "Logged out :("
    redirect_to root_path
  end

end