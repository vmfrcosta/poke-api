# frozen_string_literal: true

module PokeApi
  def initialize
    @endpoint = "https://pokeapi.co/api/v2"
  end

  def get(method)
    start endpoint(method) do |uri|
      get = Net::HTTP::Get.new(uri.request_uri)
      get
    end
  end

  private
  def start(uri)
    options = { use_ssl: uri.scheme == "https" }

    Net::HTTP.start(uri.host, uri.port, options) do |http|
      request = yield uri

      parse(http.request(request))
    end
  end

  def parse(response)
    JSON.parse(response.body).tap do |data|
      unless response.code.to_i.between?(200, 299)
        raise Digipix::ApiError, data["message"]
      end
    end
  end

  def endpoint(method)
    URI.parse("#{@endpoint}/#{method}")
  end
end
