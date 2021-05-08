class Ability < ApplicationRecord
  belongs_to :pokemon

  validates :name, presence: true
  validates :description, presence: true
end
