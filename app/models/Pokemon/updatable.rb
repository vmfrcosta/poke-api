# frozen_string_literal: true

module Pokemon::Updatable
  extend ActiveSupport::Concern

  def needs_update?
    updated_at < Date.today - 365.days || created_at > Time.now - 1.second
  end

  def update_abilities
    abilities_list = get_poke_info_for("https://pokeapi.co/api/v2/pokemon/#{name}")["abilities"]
    abilities_list.each do |ability_hash|
      ability_name = ability_hash["ability"]["name"]
      ability = abilities.find_or_initialize_by name: ability_name
      effect_info = get_poke_info_for(ability_hash["ability"]["url"])
      effect_info_en = effect_info["effect_entries"].detect { |effect| effect["language"]["name"] == "en" }
      effect_description = effect_info_en["effect"]
      ability.description = effect_description
      ability.save!
    end
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
