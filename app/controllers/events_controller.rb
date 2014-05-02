class EventsController < ApplicationController
  def index
    @events = Event.all
  end

  def new
    @event= Event.new
  end

  def create
    @event= Event.create(event_name: params[:event][:event_name], event_type: params[:event][:event_type], date: params[:event][:date], time: params[:event][:time])
    redirect_to events_path
  end

  def show
    @event = Event.find(params[:id])
  end

  def edit
    @event = Event.find(params[:id])
  end

  def update
    @event = Event.find(params[:id])
    @event.update(event_name: params[:event][:event_name], event_type: params[:event][:event_type], date: params[:event][:date], time: params[:event][:time])
    redirect_to events_path
  end

  def destroy
    @event = Event.find(params[:id]).destroy
    redirect_to events_path
  end
end