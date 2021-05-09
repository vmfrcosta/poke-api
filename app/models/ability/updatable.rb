# frozen_string_literal: true

module Ability::Updatable
  extend ActiveSupport::Concern

  def set_description
    self.description = PokemonApi.get_ability_description(self)
  end
end
