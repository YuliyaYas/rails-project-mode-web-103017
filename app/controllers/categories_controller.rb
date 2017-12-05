class CategoriesController < ApplicationController

  def index

  end

  def show

  end



  private

  def user_params(*args)
    params.require(:user).permit(*args)
  end


end
