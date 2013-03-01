class ActivitiesController < ActionController::Base
  before_filter :get_entry, :only => [:edit, :update, :destroy]
  before_filter :check, :only => [:edit, :update, :destroy]


  def get_activity
    @activity = Activity.find(params[:id])
  end

  def check
    if session[:person_id] != @activity.person_id
      flash[:notice] = "Sorry, you are not the Ijacek who wrote this"
      redirect_to entries_path
    end
  end

   def create
      @activity = Activity.new(params[:activity])
      @activity.person_id = current_user
      @activity.save
      redirect_to activites_path
      flash.notice = "Activity created, hope it was fun!"

  end

 end