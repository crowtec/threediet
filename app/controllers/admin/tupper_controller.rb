class Admin::TupperController < AdminController

  def new
    @event = Event.new
  end

  def create
    @event = Event.new(event_params)
    @event.save!
    redirect_to admin_event_index_path, :notice => 'Event was successfully created.'
  rescue => error
    render :new
  end
end
