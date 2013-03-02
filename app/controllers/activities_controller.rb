class ActivitiesController < ApplicationController
  before_filter :get_activity, :only => [:edit, :update, :destroy]
  before_filter :check, :only => [:edit, :update, :destroy]


  def get_activity
    @activity = Activity.find(params[:id])
  end

  def check
    unless current_user
      flash[:notice] = "Sorry, you are not loged in"
      redirect_to entries_path
    end
  end

  def new
  @activity = Activity.new
  end

  def create
  @activity = Activity.new(params[:activity])
  @activitiy.activity_person_id.select! { |person_id| person_id != "" }
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

  def update
    @activity.activity_person_id << current_user.id
    @activity.save
    flash[:notice] = "You just added yourself to the event!"
    redirect_to activity_path
  end

 end