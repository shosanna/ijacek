class IjacekController < ApplicationController

  def create
    Person.change_next
    flash[:notice] = "Ijacek exchange was saved!"
    redirect_to root_path
  end

end