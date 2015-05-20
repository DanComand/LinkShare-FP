class BookmarksController < ApplicationController
  def index
  	@bookmarks = Bookmark.all
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
