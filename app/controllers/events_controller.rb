class EventsController < ApplicationController
  before_action :authenticate_user!, only: [:show]
  before_action :event_info, only: [:show, :destroy, :edit, :update]

  def index
    @users = User.all
    @artists = Artist.all
    @events = Event.includes(:user)
  end

  def new
    @event = Event.new
  end

  def show
    @user = User.find_by(id: @event.user_id)
    @events = @user.events
  end

  def create
    @event = current_user.events.create(event_parameter)
    if @event.save
      redirect_to event_path(@event)
    else
      reder 'new'
    end
  end

  def destroy
    if @event.destroy
      redirect_to events_path(@event), notice: "イベント内容を削除しました"
    else
      render 'edit'
    end
  end

  def edit
    @user = User.find_by(id: @event.user_id)
    @events = @user.events
  end

  def update
    if @event.update(event_parameter)
      redirect_to events_path(@event), notice: "編集しました"
    else
      render 'edit'
    end
  end

  private

  def event_parameter
    params.require(:event).permit(:title, :content, :start_time).merge(user_id: current_user.id)
  end

  def event_info
    @event = Event.find(params[:id])
  end

end
