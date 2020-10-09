# frozen_string_literal: false

require 'uri'
require 'net/http'
require 'openssl'
require './lib/methods.rb'

# jokes class containing an array of chokes
class Jokes
  include Methods
  attr_reader :dad_jokes
  def initialize
    @dad_jokes = ['Why couldn\'t covid get a drink at the bar? because he was 19',
                  'How do you get a squirrel to like you? Act like a nut.',
                  'I don\'t trust stairs. They\'re always up to something',
                  'Did you hear the rumor about butter? Well, I\'m not going to spread it!',
                  'Why can\'t a nose be 12 inches long? Because then it would be a foot.']
  end

  def random_joke
    Methods.rand_string(@dad_jokes)
  end
end
# frozen_string_literal: true
