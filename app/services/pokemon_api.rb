class PokemonApi
  def self.get_pokemon_abilities(pokemon)
    get_poke_info_at("https://pokeapi.co/api/v2/pokemon/#{pokemon.name}")["abilities"].map { |ability| ability.first.last }
  end

  def self.get_ability_description(ability)
    effect_info = get_poke_info_at(ability.url)
    effect_info_en = effect_info["effect_entries"].detect { |effect| effect["language"]["name"] == "en" }
    effect_info_en["effect"]
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