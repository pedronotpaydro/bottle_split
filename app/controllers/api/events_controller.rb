class Api::EventsController < ApplicationController
  before_action :authenticate_user, except: [:index, :show]

  def index
    # @events = Event.all.order("date ASC")
    if params[:active] == "live"
      # @events = Event.all
      # @events.map { |event|
      #   # event.active?
      #   if event.beer.image.nil? && event.beer.style.downcase == "stout"
      #     event.beer.image = "https://beerconnoisseur.com/sites/default/files/articles/2020/the_difference_between_porter_and_stout/porter_and_stout.jpg"
      #     event.beer.save
      #   elsif event.beer.image.nil? && event.beer.style.downcase == "ipa"
      #     event.beer.image = "https://content.kegworks.com/hs-fs/hubfs/Imported_Blog_Media/kegworks-guide-to-ipas-1-1200x800-2.jpg?width=1200&height=800&name=kegworks-guide-to-ipas-1-1200x800-2.jpg"
      #     event.beer.save
      #   elsif event.beer.image.nil? && event.beer.style.downcase == "neipa"
      #     event.beer.image = "https://brew4fun.files.wordpress.com/2019/03/dsc_5449-1.jpg"
      #     event.beer.save
      #   elsif event.beer.image.nil? && event.beer.style.downcase == "sour"
      #     event.beer.image = "https://content.kegworks.com/hs-fs/hubfs/Imported_Blog_Media/kegworks-guide-to-ipas-1-1200x800-2.jpg?width=1200&height=800&name=kegworks-guide-to-ipas-1-1200x800-2.jpg"
      #     event.beer.save
      #   end
      # }
      @events = Event.where(date: Time.now..1.month.from_now).order("date ASC").limit(4)
    elsif params[:my_events] == "this_user"
      @events = Event.where(user_id: current_user)
    else
      @events = Event.all.order("date ASC")
    end

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
      if @event.beer.image.nil? && @event.beer.style.downcase == "stout"
        @event.beer.image = "https://beerconnoisseur.com/sites/default/files/articles/2020/the_difference_between_porter_and_stout/porter_and_stout.jpg"
        @event.beer.save
      elsif @event.beer.image.nil? && @event.beer.style.downcase == "ipa"
        @event.beer.image = "https://content.kegworks.com/hs-fs/hubfs/Imported_Blog_Media/kegworks-guide-to-ipas-1-1200x800-2.jpg?width=1200&height=800&name=kegworks-guide-to-ipas-1-1200x800-2.jpg"
        @event.beer.save
      elsif @event.beer.image.nil? && @event.beer.style.downcase == "neipa"
        @event.beer.image = "https://brew4fun.files.wordpress.com/2019/03/dsc_5449-1.jpg"
        @event.beer.save
      elsif @event.beer.image.nil? && @event.beer.style.downcase == "sour"
        @event.beer.image = "https://content.kegworks.com/hs-fs/hubfs/Imported_Blog_Media/kegworks-guide-to-ipas-1-1200x800-2.jpg?width=1200&height=800&name=kegworks-guide-to-ipas-1-1200x800-2.jpg"
        @event.beer.save
      end
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
    @event.beer.name = params[:beer] || @event.beer.name
    @event.beer.description = params[:beer_description] || @event.beer.description
    @event.beer.style = params[:style] || @event.beer.style
    @event.beer.brewery = params[:brewery] || @event.beer.brewery

    @event.beer.save
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
