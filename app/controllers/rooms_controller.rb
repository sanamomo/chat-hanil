class RoomsController < ApplicationController
  # before_action :set_item

  def index
  end

  def new
    @room = Room.new
    # @room.room_users.build
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

  private

  def room_params
    params.require(:room).permit(:name, user_ids: [])
  end
end

# @room.users = User.where(id: params[:user_ids])
# def set_item
  #   @room = Room.find(params[:id])
  # end