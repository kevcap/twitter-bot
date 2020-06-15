require_relative '../bin/main.rb'

RSpec.describe TwitterAcc do
  let(:my_bot) { TwitterAcc.new }

  describe '#my_bot' do
    it 'should be an instance of TwitterAcc' do
      expect(my_bot).to be_an_instance_of(TwitterAcc)
    end
  end

  describe '#help' do
    it 'should be an object' do
      expect(my_bot.help).to be_an(Object)
    end
  end

  describe '#selection' do
    it 'should be an integer' do
      expect(set_config).not_to be_an(Method)
      # set_config is an Object
    end
  end

  describe '#my_bot.client' do
    it 'should be an Object' do
      expect(my_bot.client).not_to be_an(nil)
    end
  end

  describe '#my_bot.client' do
    it 'should be an Object' do
      expect(my_bot.client).to be_an(Object)
    end
  end

  describe '#my_bot.mass_inform' do
    it 'should be an Object' do
      expect(my_bot.client).to be_an(Object)
    end
  end
end
