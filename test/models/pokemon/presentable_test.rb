require "test_helper"

class Pokemon::PresentableTest < ActiveSupport::TestCase
  test "abilities json is returned correctly" do
    expected_json = {
      "imposter" => "This Pokémon transforms into a random opponent upon entering battle.  This effect is identical to the move transform.",
      "limber" => "This Pokémon cannot be paralyzed.\n\nIf a Pokémon is paralyzed and acquires this ability, its paralysis is healed; this includes when regaining a lost ability upon leaving battle."
    }
    assert_equal expected_json, pokemons(:ditto).abilities_json
  end
end
