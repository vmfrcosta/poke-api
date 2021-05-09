class PokeApi


  private

  def get_poke_info_for(url)
    uri = URI.parse(url)
    options = { use_ssl: uri.scheme == "https" }

    response = Net::HTTP.start(uri.host, uri.port, options) do |http|
      request = Net::HTTP::Get.new(uri.request_uri)
      JSON.parse(http.request(request).body)
    end
    response
  end
end