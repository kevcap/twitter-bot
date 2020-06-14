# rubocop:enable Layout/LineLength, Style/GlobalVars
require 'rest-client'
require 'json'

class Covid_Numbers
  def inform(query)
    country = ''
    case query
    when 1
      country = 'united-states'
    when 2
      country = 'brazil'
    when 3
      country = 'russia'
    when 4
      country = 'italy'
    when 5
      country = 'india'
    end

    base_url = 'https://api.covid19api.com/total/country/'
    begin
      resp = RestClient.get "#{base_url}#{country}"
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
# rubocop:disable Layout/LineLength, Style/GlobalVars
