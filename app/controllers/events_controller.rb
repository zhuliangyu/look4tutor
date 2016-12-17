class EventsController < InheritedResources::Base
  before_action :set_tutor
  before_action :set_event
  before_action :user_authentication

  def new
    if is_right_user?
      @event=Event.new
    end


  end

  def create


    @event=Event.new(event_params)
    @event.tutor=@tutor

    if is_right_user? && @event.save
      redirect_to tutor_path(@tutor), notice: 'New event is created'
    else
      redirect_to tutor_path(@tutor), alert: 'You do not have right to create an event. Please login as a tutor'

    end


  end

  def destroy
    @tutor=@event.tutor
    @event.destroy
    redirect_to tutor_path(@tutor)

  end

  def show
    @tutor=@event.tutor


  end

  def edit

    # @tutor=@event.tutor


  end

  def index
    @events=@tutor.events

  end


  private
  def set_tutor
    if params[:tutor_id]
      @tutor=Tutor.find(params[:tutor_id])
      # else
      #   @tutor=Tutor.find(params[:id])

    end
  end

  def set_event
    @event=Event.find(params[:id]) if params[:id]
  end

  def event_params
    params.require(:event).permit(:title, :start_time, :end_time)
  end

  def is_right_user?
    session[:user_id] == params[:tutor_id]
  end
end

