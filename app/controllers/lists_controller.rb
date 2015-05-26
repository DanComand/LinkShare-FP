class ListsController < ApplicationController




  def index
    @list = current_user.lists
  end

  def show
    @list = List.find(params[:id])
    @bookmarks = current_user.bookmarks.order(created_at: :desc)
  end

  def new
  	@list = List.new
  end

  def create
  	
  	@list = List.new(list_params)
    @list.user_id = current_user.id
    if @list.save
    	redirect_to lists_path, notice: "List Created! Now add some links!"
    end
  end

  def edit
  end

  private

  def list_params
  	params.require(:list).permit(:name, :user_id)
  end
end
