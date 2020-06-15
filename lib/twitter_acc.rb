# rubocop:disable Layout/LineLength, Style/GlobalVars
require 'Twitter'
require_relative './client.rb'
require_relative './covid.rb'

class TwitterAcc < CovidNumbers
  attr_accessor :client

  def initialize
    @client = Twitter::REST::Client.new $config
  end

  def update_tweet(tweet)
    if tweet.length > 280
      puts "this tweet its too long: #{tweet.length}, make it smaller"
      help
    else
      @client.update(tweet)
    end
  end

  def favorite
    topics = ['cure to covid19', "we'll beat covid", "I'm cured of corona"]
    tweets = @client.search(topics.sample, result_type: 'recent').take(15)
    @client.favorite(tweets)
    help
  end

  def inform_symptoms(user)
    update_tweet("Hey @#{user} Diagnostic Tip:\nGet tested for COVID if you have ANY symptom from this list:\nNausea/diarrhea\nRash/red toes\n Fatigue/body aches\nLoss of taste/smell\nCough, sore throat, chest pain\nFever, chills\n~20% patients DON’T have typical fever/respiratory symptoms")
  end

  def inform_nearby_hospitals(user)
    update_tweet("@#{user}, here are the nearby hospitals, if you ever need https://www.google.com/maps/search/emergency/")
  end

  def mass_inform(sleep_time)
    sleep(sleep_time.to_i)
    topics = ["I think I've got corona", "I think I've got coronavirus", "I think I've god covid19"]
    tweets = @client.search(topics.sample, result_type: 'recent').take(2)

    tweets.each do |tweet|
      inform_symptoms(tweet.user.screen_name)
      inform_nearby_hospitals(tweet.user.screen_name)
    end
    help
  end

  def help
    puts
    puts 'Done!'
    puts 'Command list:'
    puts 'Type 1 To mass inform both symptoms and nearby emergencies'
    puts 'Type 2 To favorite tweets'
    puts 'Type 3 To update about covid numbers'
    puts 'Type 0 or hold ctrl and type C to leave'
    puts
  end

  private :inform_symptoms, :inform_nearby_hospitals
end
# rubocop:enable Layout/LineLength, Style/GlobalVars
