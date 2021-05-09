class Ability < ApplicationRecord
  belongs_to :pokemon, touch: true

  validates :name, presence: true
  validates :description, presence: true
end
