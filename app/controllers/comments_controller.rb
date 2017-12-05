class CommentsController < ApplicationController

  def new

  end

  def create

  end

  def show

  end

  def edit

  end

  def update

  end

  def destroy

  end

  private

  def user_params(*args)
    params.require(:user).permit(*args)
  end


end
