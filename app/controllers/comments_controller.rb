class CommentsController < ApplicationController
  before_action :authorized, only: [:update, :delete, :edit]

  def create
    @comment = Comment.new(comment_params)
    @event = Event.find(params[:id])
    @comment.event_id = @event.id
    @comment.save
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
    @comment.update(comment_params)
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
  end

  private

  def comment_params
    params.permit(:content, :user_id)
  end

  def authorized
    @comment = Comment.find(params[:id])
    @event = @comment.event_id
    @user = current_user
    if @comment.user_id == @user.id
    else
      flash[:message] = "This aint your son!"
      redirect_to event_path(@event)
    end

  end
end
