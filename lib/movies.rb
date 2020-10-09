# frozen_string_literal: false

require 'uri'
require 'net/http'
require 'openssl'

class Movies
    def movie(query='game')
        url = URI("https://imdb8.p.rapidapi.com/title/auto-complete?q=#{query}")

        http = Net::HTTP.new(url.host, url.port)
        http.use_ssl = true
        http.verify_mode = OpenSSL::SSL::VERIFY_NONE

        request = Net::HTTP::Get.new(url)
        request['x-rapidapi-host'] = 'imdb8.p.rapidapi.com'
        request['x-rapidapi-key'] = '0e3f23eb4emsh19bf5893637a698p13d9c7jsn2f522f9c39b0'

        response = http.request(request)
        response.read_body
     
        JSON.parse(response.read_body)['d'].map {|x| {imageUrl:x['i']["imageUrl"],title:x['l'],rank:x['rank']} }
    end
   

end
