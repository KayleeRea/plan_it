class EventsController < ApplicationController
  def index

  end
  def new
    @event = Event.all
  end
  def create

  end
end