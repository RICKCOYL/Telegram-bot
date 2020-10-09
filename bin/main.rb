# !/usr/bin/env ruby

# frozen_string_literal: false

# rubocop:disable Layout/LineLength
require 'telegram/bot'
require './lib/movies.rb'
require './lib/jokes.rb'

my_token = '1360613957:AAG9BgrQTtYUCs8TFIMab_VMRfVrfUNE4ow'.freeze

Telegram::Bot::Client.run(my_token, logger: Logger.new($stderr)) do |bot|
  puts bot
  bot.listen do |message|
    case message.text
    when '/start'
      bot.api.send_message(chat_id: message.chat.id, text: 'Hello,i am Jarvis! do you want to see random movie choices then type /movies or type /joke for a some dad jokes')

    when '/movies'
      film = Movies.new
      films = film.movie
      filmz = films[rand(films.size)]

      bot.api.send_message(chat_id: message.chat.id, text: "The name of the movie is  #{filmz[:title]} #{filmz[:imageUrl]} and has a rank of #{filmz[:rank]}".to_s, date: message.date)

    when '/joke'
      joke = Jokes.new

      bot.api.send_message(chat_id: message.chat.id, text: joke.random_joke)

    when '/stop'

      bot.api.send_message(chat_id: message.chat.id, text: "Bye, #{message.from.first_name}", date: message.date)

    else
      bot.api.send_message(chat_id: message.chat.id, text: "Invalid entry, #{message.from.first_name}, you need to use  /start,  /joke , /movies or /stop")
    end
  end
end
# rubocop:enable Layout/LineLength

# frozen_string_literal: true
