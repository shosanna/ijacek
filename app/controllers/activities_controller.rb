class ActivitiesController < ApplicationController
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
    @activity.activity_person_id.select! { |id| id.present? }
    @activity.save
    redirect_to entries_path
    flash.notice = "Activity created, hope it was fun!"
  end

  def show
    @activity = Activity.find(params[:id])
  end

  def index
    @activities = Activity.all

  end

 end