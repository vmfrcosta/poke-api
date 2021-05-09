require "test_helper"

class PokemonTest < ActiveSupport::TestCase
  test "that all fixtures are valid" do
    assert pokemons.all?(&:valid?)
  end

  test "that validations are working" do
    pokemon = Pokemon.new

    assert pokemon.invalid?
    assert_equal 1, pokemon.errors.count
    assert_equal ["can't be blank"], pokemon.errors[:name]
  end
end
