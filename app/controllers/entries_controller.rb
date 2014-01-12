class EntriesController < ApplicationController
  before_filter :get_entry, :only => [:edit, :update, :destroy]
  before_filter :check, :only => [:edit, :update, :destroy]


  def get_entry
    @entry = Entry.find(params[:id])
  end

  def check
    if session[:person_id] != @entry.person_id
      flash[:notice] = "Sorry, you are not the Ijacek who wrote this"
      redirect_to entries_path
    end
  end

  def index
    @entry = Entry.new
    @entries = Entry.order("created_at DESC")

    @activities = Activity.recent
    @activity = Activity.new

    @answers = Answer.all.sample(3)
    @comments = Comment.order("created_at DESC").take(4)
  end

  def create
    @entry = Entry.new(params[:entry])
    @entry.person = current_user
    @entry.save
    flash.notice = "Entry created!"
    redirect_to root_path
  end

  def edit
  end

  def update

    @entry.update_attributes(params[:entry])
    redirect_to entries_path
    flash.notice = "Entry changed!"
  end

  def destroy
    @text = @entry.text
    @entry.destroy
    redirect_to entries_path
    flash.notice = "<p class='red'> Your entry '<em>#{@text}</em>' has been removed </p>"
  end

end