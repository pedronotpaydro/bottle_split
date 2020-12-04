class Api::BeersController < ApplicationController
  def index
    @beers = Beer.all
    render "index.json.jb"
  end

  def show
    @beer = Beer.find_by id: params[:id]
    render "show.json.jb"
  end

  def create
    @beer = Beer.create(
      name: params[:name],
      brewery: params[:brewery],
      style: params[:style],
      description: params[:description],
    )
    render "show.json.jb"
  end

  def update
    @beer = Beer.find_by id: params[:id]
    @beer.name = params[:name] || @beer.name
    @beer.brewery = params[:brewery] || @beer.brewery
    @beer.style = params[:style] || @beer.style
    @beer.description = params[:description] || @beer.description
    @beer.save
    render "show.json.jb"
  end

  def destroy
    @beer = Beer.find_by id: params[:id]
    @beer.destroy
    render json: {}
  end
end
