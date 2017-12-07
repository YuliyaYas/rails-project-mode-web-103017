class CommentsController < ApplicationController
  before_action :authorized, only: [:update, :delete, :edit]
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
