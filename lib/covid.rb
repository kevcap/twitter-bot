# rubocop:disable Metrics/MethodLength, Metrics/CyclomaticComplexity
require 'rest-client'
require 'json'
require_relative './twitter_acc.rb'

class CovidNumbers
  @country = ''
  def get_contry(q)
    case q
    when 1
      @country = 'united-states'
    when 2
      @country = 'brazil'
    when 3
      @country = 'russia'
    when 4
      @country = 'italy'
    when 5
      @country = 'india'
    end
    inform(@country)
  end

  def inform(query)
   base_url = 'https://api.covid19api.com/total/country/'
    begin
      resp = RestClient.get "#{base_url}#{query}"
      @data = JSON.parse(resp.body)
      @data = @data[-1]
      text = "Last numbers of Covid19 in #{@data['Country']}: Cases: #{@data['Confirmed']}, Deaths: #{@data['Deaths']}"
      puts text
      update_tweet(text)
      help
    rescue RestClient::ExceptionWithResponse => e
      puts 'We had a connection issue, please try again!'
      e.response
      help
    end
  end
end
# rubocop:enable Metrics/MethodLength, Metrics/CyclomaticComplexity:
