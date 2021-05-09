require "test_helper"

class AbilityTest < ActiveSupport::TestCase
  test "that all fixtures are valid" do
    assert abilities.all?(&:valid?)
  end

  test "that all validations are working" do
    ability = Ability.new

    assert ability.invalid?
    assert_equal 3, ability.errors.count
    assert_equal ["can't be blank"], ability.errors[:name]
    assert_equal ["can't be blank"], ability.errors[:description]
    assert_equal ["must exist"], ability.errors[:pokemon]
  end
end
