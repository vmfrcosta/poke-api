# frozen_string_literal: true

module Pokemon::Updatable
  extend ActiveSupport::Concern

  def needs_update?
    updated_at < Date.today - 365.days || created_at > Time.now - 1.second
  end

  def update_abilities
    abilities_list = ::PokemonApi.get_pokemon_abilities(self)
    abilities_list.each do |ability_info|
      ability_name = ability_info["name"]
      ability = abilities.find_or_initialize_by name: ability_name
      ability.url = ability_info["url"]
      ability.set_description
      ability.save
    end
  end
end
