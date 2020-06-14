require 'Twitter'
require_relative './client.rb'
require_relative './covid.rb'

class TwitterAcc 
  attr_accessor :client

  def initialize
    @client = Twitter::REST::Client.new $config
  end

end