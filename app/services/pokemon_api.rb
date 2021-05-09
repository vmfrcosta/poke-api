class PokemonApi
  def self.get_pokemon_abilities(pokemon)
    info = get_poke_info_at("https://pokeapi.co/api/v2/pokemon/#{pokemon.name}")
    info["abilities"].map { |ability| ability.first.last }
  end

  def self.get_ability_description(ability)
    info = get_poke_info_at(ability.source)
    info_en = info["effect_entries"].detect { |entry| entry["language"]["name"] == "en" }
    info_en["effect"]
  end

  private

  def self.get_poke_info_at(url)
    uri = URI.parse(url)
    options = { use_ssl: uri.scheme == "https" }

    response = Net::HTTP.start(uri.host, uri.port, options) do |http|
      request = Net::HTTP::Get.new(uri.request_uri)
      JSON.parse(http.request(request).body)
    end
    response
  end
end