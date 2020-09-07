class BlogsController < ApplicationController
  before_action :set_blog, only: [:show, :edit, :update, :destroy]
  
  def index
      @blog = Blog.all
      @user = User.all
  end
  
  def new
      if params[:back]
          @blog = Blog.new(blog_params)
      else        
          @blog = Blog.new
      end
  end

  def create
    @blog = Blog.new(blog_params)
    @blog = current_user.blogs.build(blog_params) 
    if params[:back]
        render :new
    else
        if @blog.save
          BlogMailer.contact_mail(@blog).deliver
          #redirect_to blogs_path, notice: "Blogs Enregistrer"
          redirect_to blogs_path,  flash: { success: "Post was created successfully"}
        else
          #render :new, flash: { info: "Post was not saved!"}
          render :new
        end
    end
  end

  def confirm
    @blog = Blog.new(blog_params)
    @blog = current_user.blogs.build(blog_params) 
    render :new if @blog.invalid?
  end

  def update
    if @blog.update(blog_params)
        redirect_to blogs_path,   flash: { info: "Post was updated successfully"}
    else
        render :edit
    end
  end

  def destroy
    @blog = current_user.blogs.find(params[:id])
    @blog.destroy
    redirect_to blogs_path,   flash: { warning: "Post was deleted successfully"}
  end

  def show
    @favorite = current_user.favorites.find_by(blog_id: @blog.id) 
  end

  private
  def blog_params
    params.require(:blog).permit(:content, :image, :image_cache, :user_id)
  end

  def set_blog
    @blog = Blog.find(params[:id])
  end

end
