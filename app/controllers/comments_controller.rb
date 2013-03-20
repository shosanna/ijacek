class CommentsController < ApplicationController

def create
  comment = Comment.create!(params[:comment])
  if comment.commentable_type == "Entry"
    redirect_to root_path
  else
    redirect_to comment.commentable
  end
end

end
