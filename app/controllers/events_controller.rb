class EventsController < ApplicationController

  def index
    @past = Event.past 
    @future = Event.future
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
    @invitation = Attendance.new
    @maker = @event.creator
    @uninvited = Event.uninvited(@event.attendees).map { |uninvited| [uninvited.name, uninvited.id] }
  end

  def create
    @event = current_user.events.build(event_params)
    if @event.save
      Attendance.create(attendee_id: @event.creator.id,attended_event_id: @event.id)
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
