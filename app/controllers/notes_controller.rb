class NotesController < ApplicationController
	  before_filter :load_bookmark

	def new
	  @note = Note.new
	end
  
  def show
  	@note = Note.find(params[:id])
  end

  def create
  	@note = @bookmark.notes.build(note_params)
  	@note.user = current_user


  	if @note.save
      redirect_to list_bookmarks_url(@bookmark.list), notice: 'Comment added!'
  	else
      flash.now[:alert] = "Comment not saved!"
  		render 'bookmarks/index'
  	end
  end

  def destroy
  	@note = Note.find(params[:id])
  	@note.destroy
  end

  private
  def note_params
  	params.require(:note).permit(:comment, :bookmark_id, :user_id)
  end

  def load_bookmark
  	@bookmark = Bookmark.find(params[:bookmark_id])
  end
end
