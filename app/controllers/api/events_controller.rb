class Api::EventsController < ApplicationController
  def index
    @events = Event.all
    render "index.json.jb"
  end

  def show
    @event = Event.find_by id: params[:id]
    render "show.json.jb"
  end

  def create
    @event = Event.create(
      name: params[:name],
      location: params[:location],
      date: params[:date],

    )
    render "show.json.jb"
  end

  def update
    @event = Event.find_by id: params[:id]
    @event.name = params[:name] || @event.name
    @event.location = params[:location] || @event.location
    @event.date = params[:date] || @event.date

    @event.save
    render "show.json.jb"
  end

  def destroy
    @event = Event.find_by id: params[:id]
    @event.destroy
    render json: {}
  end
end
