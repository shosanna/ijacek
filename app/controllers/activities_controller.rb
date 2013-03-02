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

  def new
  @activity = Activity.new(params[:id])
  # Doprdele jak to ze to funguje ? Nechapu proc mam taddy v zavorce id a dole activity
  end

  def create
  @activity = Activity.new(params[:activity])
  @activity.save
  flash.notice = "Activity created, hope it was fun!"
  redirect_to entries_path
   end

  def show
    @activity = Activity.find(params[:id])
  end

  def index
    @activities = Activity.all

  end

  # def update
  #   @activity.update_attributes(params[:activity_person_id])
  # end

 end