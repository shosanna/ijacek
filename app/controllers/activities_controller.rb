class ActivitiesController < ApplicationController
  before_filter :get_activity, :only => [:edit, :update, :destroy]
  before_filter :check, :only => [:edit, :update, :destroy]


  def get_activity
    @activity = Activity.find(params[:id])
  end

  def check
    unless current_user
      flash[:notice] = "Sorry, you are not logged in"
      redirect_to entries_path
    end
  end

  def new
    @activity = Activity.new
  end

  def create
    params[:activity][:activity_person_id].reject!(&:blank?)
    @activity = Activity.new(params[:activity])
    @activity.save
    flash.notice = "Activity created, hope it was fun!"
    redirect_to activities_path
  end

  def edit


  end

  def show
    @activity = Activity.find(params[:id])
  end

  def index
    @activities = Activity.all(:order => 'created_at DESC')
  end

  def rsvp
    @activity = Activity.find(params[:id])
    @activity.activity_person_id << current_user.id
    @activity.save
    flash[:notice] = "You just added yourself to the event!"
    redirect_to activity_path
  end

  def un_rsvp
    @activity = Activity.find(params[:id])
    @activity.activity_person_id.delete(current_user.id)
    @activity.save
    flash[:notice] = "You deleted yourself from the event!"
    redirect_to activity_path
  end

  def update
    params[:activity][:activity_person_id].reject!(&:blank?)
    @activity.update_attributes(params[:activity])
    redirect_to activity_path
    flash.notice = "Entry changed!"
  end


 end