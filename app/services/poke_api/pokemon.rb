# frozen_string_literal: true

class PokeApi::Pokemon
  def self.find(pokemon)
    PokeApi.get("pokemon/#{pokemon}")
  rescue
    nil
  end
end
