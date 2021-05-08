class Pokemon < ApplicationRecord
  validates :name, presence: true

  has_many :abilities

  def sorted_abilities
    abilities.sort_by(&:name)
  end
end
