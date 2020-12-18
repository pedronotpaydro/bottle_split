class Api::EventsController < ApplicationController
  before_action :authenticate_user, except: [:index, :show]

  def index
    @events = Event.all.order(:date)
    render "index.json.jb"
  end

  def show
    @event = Event.find_by id: params[:id]
    render "show.json.jb"
  end

  def create
    @event = Event.new(
      name: params[:name],
      location: params[:location],
      date: params[:date],
      user_id: current_user.id,
      beer_id: Beer.last.id,
    )

    if @event.save
      render "show.json.jb"
    else
      render json: { errors: @event.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def update
    @event = Event.find_by id: params[:id]
    @event.name = params[:name] || @event.name
    @event.location = params[:location] || @event.location
    @event.date = params[:date] || @event.date

    @event.save
    if @event.save
      render "show.json.jb"
    else
      render json: { errors: @event.erros.full_messages }, status: :unprocessable_entity
    end
  end

  def destroy
    @event = Event.find_by id: params[:id]
    @event.destroy
    render json: { message: "Event Removed!" }
  end
end
