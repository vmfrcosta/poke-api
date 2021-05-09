class Ability < ApplicationRecord
  include Updatable

  belongs_to :pokemon, touch: true

  validates :name, presence: true
  validates :description, presence: true
end
