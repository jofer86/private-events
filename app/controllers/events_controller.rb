class EventsController < ApplicationController

  def index
    @events = Event.all
  end

  def new
    if current_user.nil?
      redirect_to login_path
    else
      @event = current_user.events.build
    end
  end

  def show
    @event = Event.find_by(id: params[:id])
  end

  def create
    @event = current_user.events.build(event_params)
    if @event.save
      redirect_to @event
    else
      render 'new'
    end
  end

  private

  def event_params
    params.require(:event).permit(:description, :e_date)
  end

end
