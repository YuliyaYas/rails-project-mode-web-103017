class CategoriesController < ApplicationController

  def index
    @categories = Category.all
  end

  def show
    @category = Category.find(params[:id])
  end


  private

  def user_params(*args)
    params.require(:user).permit(*args)
  end


end
