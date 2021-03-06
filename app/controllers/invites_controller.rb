class InvitesController < ApplicationController
  def index
  	# @invites = Invite.all
    @lists = Invite.where(email: current_user.email).map{|x| x.list }
    # binding.pry
  end

  def show
  end

  def new
    @list = List.find params[:list_id]
  	@invite = Invite.new
  end

  def create
  	@list = List.find(params[:list_id])
    @invite = @list.invites.build(invite_params)
    @invite.user_id = current_user.id

    if @invite.save
      redirect_to list_url(@list), notice: "Invite Sent!"
    else
      render :new
    end
  end

  def edit
  end

  private
  def invite_params
    params.require(:invite).permit(:email, :list_id, :user_id)
  end
end
