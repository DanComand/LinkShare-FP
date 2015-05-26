class InvitesController < ApplicationController
  def index
  	@invites = Invite.all
  end

  def show
  end

  def new
  	@invite = Invite.new
  end

  def create
  	
  end

  def edit
  end
end
