class PokemonsController < ApplicationController
  def show
    abilities_list = get_poke_info_for("https://pokeapi.co/api/v2/pokemon/#{params[:pokemon]}")["abilities"].sort_by { |ability| ability["ability"]["name"] }

    abilities_hash = {}
    abilities_list.map do |ability|
      ability_name = ability["ability"]["name"]
      effect_info = get_poke_info_for(ability["ability"]["url"])
      effect_info_en = effect_info["effect_entries"].detect { |effect| effect["language"]["name"] == "en" }
      effect_dresciption = effect_info_en["effect"]

      abilities_hash[ability_name] = effect_dresciption
    end

    render json: abilities_hash
  end

  private

  def get_poke_info_for(url)
    uri = URI.parse(url)
    options = { use_ssl: uri.scheme == "https" }

    response = Net::HTTP.start(uri.host, uri.port, options) do |http|
      request = Net::HTTP::Get.new(uri.request_uri)
      JSON.parse(http.request(request).body)
    end
    response
  end
end
