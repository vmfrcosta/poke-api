class PokemonsController < ApplicationController
  def show
    pokemon = Pokemon.find_or_create_by(name: params[:pokemon])
    pokemon.update_abilities if pokemon.needs_update?
    render json: pokemon.abilities_json
  end
end
