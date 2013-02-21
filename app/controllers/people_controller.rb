class PeopleController < ApplicationController

  before_filter :get_person, :only => [:edit, :update, :destroy, :show]
  before_filter :check, :only => [:edit, :update, :destroy]

  def get_person
    @person = Person.find(params[:id])
  end

  def check
    if current_user != @person
      flash[:notice] = "Sorry, you are not this Ijacek"
      redirect_to entries_path
    end
  end

def index
  @people = Person.all
end

def show

end

def edit


end

def update
  @person.update_attributes(params[:person])
  redirect_to person_path
  flash.notice = "Profile information changed!"
end



end
