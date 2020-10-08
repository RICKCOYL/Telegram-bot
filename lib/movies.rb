# frozen_string_literal: false

require 'uri'
require 'net/http'
require 'openssl'
class Movies
    def movie
        url = URI('https://imdb8.p.rapidapi.com/title/auto-complete?q=game%20of%20thr')

        http = Net::HTTP.new(url.host, url.port)
        http.use_ssl = true
        http.verify_mode = OpenSSL::SSL::VERIFY_NONE

        request = Net::HTTP::Get.new(url)
        request['x-rapidapi-host'] = 'imdb8.p.rapidapi.com'
        request['x-rapidapi-key'] = '0e3f23eb4emsh19bf5893637a698p13d9c7jsn2f522f9c39b0'

        response = http.request(request)
        puts response.read_body
    end
end
# frozen_string_literal: true
