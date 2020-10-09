# !/usr/bin/env ruby
# frozen_string_literal: false
require 'telegram/bot'
require './lib/movies.rb'


    my_token = '1360613957:AAG9BgrQTtYUCs8TFIMab_VMRfVrfUNE4ow'.freeze
  

    Telegram::Bot::Client.run(my_token, logger: Logger.new($stderr)

  ) do |bot|
    puts bot
    bot.listen do |message|
      case message.text
        when '/start'
            bot.api.send_message(chat_id: message.chat.id, text: 'Hello,i am Jarvis! do you want to see the random best movies then type /movies')

        when '/movies'
            film = Movies.new
            films = film.movie()
            filmz = films[rand(films.size)] 
            
            bot.api.send_message(chat_id: message.chat.id, text: ("The name of the movie is  #{filmz[:title]} #{filmz[:imageUrl]} and has a rank of #{filmz[:rank]}").to_s, date: message.date)

        when '/stop'

            bot.api.send_message(chat_id: message.chat.id, text: "Bye, #{message.from.first_name}", date: message.date)

        else
             bot.api.send_message(chat_id: message.chat.id, text: "Invalid entry, #{message.from.first_name}, you need to use  /start,  /stop , /movies")
        end
    end
end