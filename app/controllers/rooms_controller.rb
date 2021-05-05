class RoomsController < ApplicationController

  def index
    # @users = User.all
  end

  def new
    @room = Room.new
    @room.users << current_user
  end

  def create
    @room = Room.new(room_params)
    @room.users = User.where(id: params[:user_ids])
    if @room.save
      render :index
      # redirect_to root_path
    else
      render :new
    end
  end

  private

  def room_params
    params.require(:room).permit(:name, user_ids: [])
  end
end
