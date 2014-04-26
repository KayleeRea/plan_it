class EventsController < ApplicationController
  def index

  end
  def new
    @event = Event.all
  end
  def create
    Event.create(event_name: params[:event_name], event_type: params[:event_type], date: params[:date], time: params[:time])
    redirect_to '/events/new'
  end
end