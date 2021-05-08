require "test_helper"


class PokemonsTest < ActionDispatch::IntegrationTest
  test "if pokemon abilites are returned correctly" do
    get pokemon_path("ditto")
    json_response = JSON.parse(response.body)

    assert_equal json_response.keys, ["imposter", "limber"]
    assert_equal json_response["imposter"], "This Pokémon transforms into a random opponent upon entering battle.  This effect is identical to the move transform."
    assert_equal json_response["limber"], "This Pokémon cannot be paralyzed.\n\nIf a Pokémon is paralyzed and acquires this ability, its paralysis is healed; this includes when regaining a lost ability upon leaving battle."
  end
end