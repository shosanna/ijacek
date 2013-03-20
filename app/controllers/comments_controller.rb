class CommentsController < ApplicationController

def create
  Comment.create!(params[:comment])
  redirect_to root_path
end

end