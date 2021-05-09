require "test_helper"

class PokemonApiTest < ActiveSupport::TestCase
  test "that api returns the correct pokemon info" do
    expected_abilities = ["imposter", "limber"]

    assert_equal expected_abilities, PokemonApi.get_pokemon_abilities(pokemons(:ditto)).map { |ability| ability["name"] }.sort
  end

  test "that api returns the correct ability description" do
    assert_equal "This Pokémon transforms into a random opponent upon entering battle.  This effect is identical to the move transform.", PokemonApi.get_ability_description(abilities(:imposter))
  end
end
