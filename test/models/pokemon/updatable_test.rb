require "test_helper"

class Pokemon::UpdatableTest < ActiveSupport::TestCase
  test "that instance knows when it needs to be updated" do
    pokemons(:ditto).update! updated_at: Date.today - 365.days
    assert_not pokemons(:ditto).needs_update?

    pokemons(:ditto).update! updated_at: Date.today - 366.days
    assert pokemons(:ditto).needs_update?
  end

  test "that abilities are updated correctly" do
    abilities(:imposter).update! description: "dsadsadsa"
    pokemons(:ditto).update_abilities

    assert_equal "This Pokémon transforms into a random opponent upon entering battle.  This effect is identical to the move transform.", abilities(:imposter).reload.description
  end
end
