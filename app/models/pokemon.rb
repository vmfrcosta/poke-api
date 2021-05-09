class Pokemon < ApplicationRecord
  include Updatable, Presentable

  has_many :abilities

  validates :name, presence: true
end
