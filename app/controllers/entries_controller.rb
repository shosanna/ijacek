class EntriesController < ApplicationController
  def index
    @entry = Entry.new
    @entries = Entry.order("created_at DESC")
  end

  def create
    @entry = Entry.new(params[:entry])
    @entry.person = current_user
    @entry.save

    redirect_to entries_path
    flash.notice = "Entry created!"

  end

  def edit
    @entry = Entry.find(params[:id])
  end

  def update
    @entry = Entry.find(params[:id])
    @entry.update_attributes(params[:entry])
    redirect_to entries_path
    flash.notice = "Entry changed!"
  end

  def show
    @entry = Entry.find(params[:id])
  end

  def destroy
    @entry = Entry.find(params[:id])
    @text = @entry.text
    @entry.destroy
    redirect_to entries_path
    flash.notice = "<p class='red'> Your entry '<em>#{@text}</em>' has been removed </p>"

  end

end