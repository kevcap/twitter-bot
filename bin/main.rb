# rubocop: disable Metrics/BlockNesting, Layout/LineLength
require 'Twitter'
require_relative '../lib/twitter_acc.rb'
system 'cls'
puts 'Welcome to your twitter bot! My mission is to inform the symptoms, nearby emergencys and covid cases, so you can get medical assistance, in case you ever need it.'

set_config
twitter = TwitterAcc.new
twitter.help
is_on = true

while is_on
  selection = gets.chomp.to_i

  case selection
  when 0
    puts 'See you!'
    is_on = false
  when 1
    print 'Whats the sleep time? '
    sleep_time = gets.chomp
    twitter.mass_inform(sleep_time)
  when 2
    puts 'Please select one country: '
    invalid = true
    while invalid
      puts '1- USA; 2- Brazil; 3- Russia; 4- Italy; 5- India'
      q = gets.chomp.to_i
      if (1..5).include?(q)
        twitter.inform(q)
        invalid = false
      else
        puts 'Please, select a valid value (between 1 and 5)'
      end
    end
  when 3
    print "Tweet: "
    tweet = gets.chomp
    twitter.update_tweet(tweet)
    twitter.help
  end
end
# rubocop: enable Metrics/BlockNesting, Layout/LineLength
