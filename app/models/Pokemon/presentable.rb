# frozen_string_literal: true

module Pokemon::Presentable
  extend ActiveSupport::Concern

  def abilities_json
    json = {}
    abilities.sort_by(&:name).each { |ability| json[ability.name] = ability.description }
    json
  end
end
