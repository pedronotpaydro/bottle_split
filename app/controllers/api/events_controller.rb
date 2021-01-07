class Api::EventsController < ApplicationController
  before_action :authenticate_user, except: [:index, :show]

  def index
    @events = Event.all.order("date ASC")
    if params[:active] == "live"
      @events = Event.all
      @events.map { |event| event.active? }
      @events = Event.where(active: true).order("date ASC").limit(4)
    elsif params[:my_events] == "this_user"
      @events = Event.where(user_id: current_user)
    end
    # if params[:my_events] == "this_user"
    #   @events = Event.where(user_id: current_user)
    # end
    render "index.json.jb"
  end

  def show
    @event = Event.find_by id: params[:id]
    render "show.json.jb"
  end

  def create
    # @beer = Beer.create(
    #   name: params[:name],
    #   brewery: params[:brewery],
    #   style: params[:style],
    #   description: params[:description],
    # ),
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
    @event.beer = params[:beer] || @event.beer
    @event.beer.description = params[:beer_description] || @event.beer.description
    # @event.active?

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
