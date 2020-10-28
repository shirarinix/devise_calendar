class EventsController < ApplicationController
  def index
    @users = User.all
    @artists = Artist.all
    @events = Event.all
  end

  def new
    @event = Event.new
  end

  def show
    @event = Event.find(params[:id])
  end

  def create
    Event.create(event_parameter)
    redirect_to event_path
  end

  def destroy
    @event = Event.find(params[:id])
    @event.destroy
    redirect_to event_path, notice:"削除しました"
  end

  def edit
    @event = Event.find(params[:id])
  end

  def update
    @event = Event.find(params[:id])
    if @event.update(event_parameter)
      redirect_to event_path, notice: "編集しました"
    else
      render 'edit'
    end
  end

    private

    def event_parameter
      params.require(:event).permit(:title, :content, :start_time)
    end

end
