class FavoritesController < ApplicationController
  def create
    favorite = current_user.favorites.create(blog_id: params[:blog_id])
    redirect_to blogs_url, notice: "The #{favorite.blog.user.name}'s post  is added to your favorites"
  end
  def destroy
    favorite = current_user.favorites.find_by(id: params[:id]).destroy
    redirect_to blogs_url, notice: "The #{favorite.blog.user.name}'s  post is removed from your favorites"
  end

  def show
    @favorite = current_user.favorites.all if logged_in?
  end
   

end
