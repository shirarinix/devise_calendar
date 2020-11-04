class EventsController < ApplicationController
  # before_action :authenticate_user!, only: [:show]

  def index
    @users = User.all
    @artists = Artist.all
    @events = Event.includes(:user)
  end

  def new
    @event = Event.new
    @events = Event.includes(:user)
  end

  def show
    # @events = Event.includes(:user)
    @event = Event.find(params[:id])
    @user = User.find_by(id: @event.user_id)
    @events = @user.events
  end

  def create
    @event = current_user.events.create(event_parameter)
    if @event.save
      redirect_to event_path(@event)
    else
      redirect_to new_event_path
    end
  end

  def destroy
    @event = Event.find(params[:id])
    if @event.destroy
      redirect_to event_path(@event), notice:"イベント内容を削除しました"
    else
      render :show
    end
  end

  # def edit
  #   @event = Event.find(params[:id])
  #   render 'show'
  # end

  # def update
  #   @event = Event.find(params[:id])
  #   if @event.update(event_parameter)
  #     redirect_to events_path, notice: "編集しました"
  #   else
  #     render 'edit'
  #   end
  # end

    private

    def event_parameter
      params.require(:event).permit(:title, :content, :start_time).merge(user_id: current_user.id)
    end

    def event_info
      @event = Event.find(params[:id])
    end
end
