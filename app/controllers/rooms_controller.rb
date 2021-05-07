class RoomsController < ApplicationController

  def index
  end

  def new
    @room = Room.new
    # @room.users = Room.find(params[:room_id])
  end

  def create
    @room = Room.new(room_params)
    @room.users = User.where(id: params[:user_ids])
    if @room.save
      render :index
    else
      render :new
    end
  end

  def destroy
    room = Room.find(params[:id])
    room.destroy
    redirect_to root_path
  end

  private

  def room_params
    params.require(:room).permit(:name, :room_id, user_ids: [])
  end
end

# @room.room_users.build

# @room.users = User.where(id: params[:user_ids])
# def set_item
  #   @room = Room.find(params[:id])
  # end

    # @room = Room.new(room_params)
    # @room_user = RoomUser.new
    # @user = current_user
    # @room = @user.rooms.new(room_params)
    # @room.users = User.where(id: params[:user_ids])
    # if @user.save
    #   render :index
    # else
    #   render :new
    # end