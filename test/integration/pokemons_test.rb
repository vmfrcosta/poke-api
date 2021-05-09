require "test_helper"


class PokemonsTest < ActionDispatch::IntegrationTest
  test "that pokemon abilites are returned correctly" do
    get pokemon_path("ditto")
    json_response = JSON.parse(response.body)

    assert_equal ["imposter", "limber"], json_response.keys
    assert_equal "This Pokémon transforms into a random opponent upon entering battle.  This effect is identical to the move transform.", json_response["imposter"]
    assert_equal "This Pokémon cannot be paralyzed.\n\nIf a Pokémon is paralyzed and acquires this ability, its paralysis is healed; this includes when regaining a lost ability upon leaving battle.", json_response["limber"]
  end

  test "that pokemon is updated if needed" do
    abilities(:imposter).update! description: "dsadsadsa"
    pokemons(:ditto).update! updated_at: Date.today - 400.days

    get pokemon_path("ditto")
    json_response = JSON.parse(response.body)

    assert_equal "This Pokémon transforms into a random opponent upon entering battle.  This effect is identical to the move transform.", json_response["imposter"]
  end
end