class CommentsController < ApplicationController

def create
  comment = Comment.create!(params[:comment])
  if comment.commentable_type == "Entry"
    redirect_to root_path
  else
    redirect_to comment.commentable
  end
end

def destroy
  @comment = Comment.find(params[:id])
  @comment.destroy
  redirect_to entries_path
  flash.notice = "<p class='red'> Your entry '<em>#{@text}</em>' has been removed </p>"
end

end
