class CommentsController < ApplicationController

  def create
    @comment = Comment.create(content: params[:content], event_id: params[:id], user_id: params[:comment][:user_id])
    @event = Event.find(@comment.event_id)
    redirect_to event_path(@event)
  end

  def show
    @comment = Comment.find(params[:id])
  end

  def edit
    @comment = Comment.find(params[:id])
  end

  def update
    @comment = Comment.find(params[:id])
    @comment.update(comment_params(:content))
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
  end

  private

  def comment_params(*args)
    params.require(:comment).permit(*args)
  end


end
