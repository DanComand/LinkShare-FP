class BookmarksController < ApplicationController
  before_filter :ensure_logged_in, only: [:index, :create, :destroy]
  

  def index
  	@bookmarks = Bookmark.where(user_id: current_user.id)
  end

  def show
  	@bookmark = Bookmark.find(params[:id])
  end

  def new
  	@bookmark = Bookmark.new
  end

  def edit
  	@bookmark = Bookmark.find(params[:id])
  end

  def create
  	@bookmark = Bookmark.new(bookmark_params)
    @bookmark.user_id = current_user.id

    meta = MetaInspector.new(@bookmark.url)
    @bookmark.title = meta.title
    @bookmark.image = meta.images.best

  	if @bookmark.save
  		redirect_to bookmarks_url
  	else
  		render :new
  	end
  end

  def update
  	@bookmark = Bookmark.find(params[:id])

  	if @bookmark.update_attributes(bookmark_params)
  		redirect_to bookmark_path(@bookmark)
  	else
  		render :edit
  	end
  end

  private
  def bookmark_params
  	params.require(:bookmark).permit(:url, :description, :user_id)
  end


end
