class InvitesController < ApplicationController
  def index
  	@invites = Invite.all
  end

  def show
  end

  def new
    @list = List.find params[:list_id]
  	@invite = Invite.new
  end

  def create
  	
  end

  def edit
  end

  private
  def invite_params
    params.require(:invite).permit(:email, :list_id, :user_id)
  end
end
