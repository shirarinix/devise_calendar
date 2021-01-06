class EventsController < ApplicationController
  before_action :move_to_index, except: [:index]
  before_action :event_info, only: [:show, :destroy, :edit, :update]
  before_action :user_info, :artist_info, only: [:index, :show, :edit]

  def index
    @users = User.all
    @artists = Artist.all
  end

  def new
    @event = Event.new
  end

  def create
    @event = Event.new(event_params)
    if @event.valid? && @event.save
      flash[:notice] = "イベントを作成しました"
      redirect_to event_path(@event)
    else
      render 'new'
    end
  end

  def show
  end

  def destroy
    if @event.destroy
      flash[:notice] = "イベントを削除しました"
      redirect_to root_path
    else
      render 'edit'
    end
  end

  def edit
  end

  def update
    @event.update(event_params)
    if @event.valid? && @event.save
      flash[:notice] = "イベントを編集しました"
      redirect_to events_path(@event)
    else
      flash[:notice] = "イベント編集に失敗しました"
      render 'edit'
    end
  end

  private

  def event_params
    if current_user
      params.require(:event).permit(:title, :content, :start_time).merge(user_id: current_user.id)
    else
      params.require(:event).permit(:title, :content, :start_time).merge(artist_id: current_artist.id)
    end
  end

  def event_info
    @event = Event.find(params[:id])
  end

  def user_info
    @user_events = Event.where("user_id")
  end

  def artist_info
    @artist_events = Event.where("artist_id")
  end

  def move_to_index
    unless signed_in?
      redirect_to action: :index
    end
  end

end