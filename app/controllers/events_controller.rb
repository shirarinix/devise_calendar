class EventsController < ApplicationController
  before_action :move_to_index, except: [:index]
  before_action :event_info, only: [:show, :destroy, :edit, :update]

  def index
    @users = User.all
    @artists = Artist.all
    @events = Event.all
  end

  def new
    @event = Event.new
  end

  def create
    @event = Event.new(event_params)
    if @event.valid? && @event.save
      flash[:notice] = '作成しました'
      redirect_to root_path
    else
      flash[:notice] = '作成出来ませんでした'
      render 'new'
    end
  end

  def show
    if @event.user.present?
      user_info
    else
      artist_info
    end
  end

  def destroy
    if @event.destroy
      flash[:notice] = '削除しました'
      redirect_to root_path
    else
      render 'edit'
    end
  end

  def edit
    if @event.user.present?
      user_info
    else
      artist_info
    end
  end

  def update
    @event.update(event_params)
    if @event.valid? && @event.save
      flash[:notice] = '編集しました'
      redirect_to root_path
    else
    flash[:notice] = '編集に失敗しました'
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
    @user = @event.user
    @events = @user.events
  end

  def artist_info
    @artist = @event.artist
    @events = @artist.events
  end

  def move_to_index
    redirect_to action: :index unless signed_in?
  end
end
