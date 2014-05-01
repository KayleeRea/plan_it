class EventsController < ApplicationController
  def index
    @events = Event.all
  end
  def new
    @event= Event.new
  end

  def create
    @event= Event.create(event_name: params[:event_name], event_type: params[:event_type], date: params[:date], time: params[:time])
    redirect_to events_path(@event)
  end

end