# rubocop:disable Style/GlobalVars, Lint/NestedMethodDefinition, Metrics/MethodLength, :
require 'twitter'

$config = {
  consumer_key: '',
  consumer_secret: '',
  access_token: '',
  access_token_secret: ''
}

def set_config
  $valid = false
  until $valid
    def ask
      puts
      p 'Please, type [1] to put your TWITTER API Keys or type [0] to leave'
      answer = gets.chomp.to_i
      if answer == 1
        p 'Please type your keys below: '
        print 'consumer_key: '
        $config[:consumer_key] = gets.chomp
        print 'consumer_secret: '
        $config[:consumer_secret] = gets.chomp
        print 'access_token: '
        $config[:access_token] = gets.chomp
        print 'access_token_secret: '
        $config[:access_token_secret] = gets.chomp
        p "Your config is: #{$config}"
        print 'is that Correct? [Y]es [N]o: [0] to leave: '
        check_if_config_is_ok = gets.chomp.upcase
        if check_if_config_is_ok == 'Y'
          $valid = true
        else
          p "You typed neither 'N' or an answer which is not Y, lets try again "
          ask
        end
      elsif answer.zero?
        exit
      else
        p 'Please, type a valid answer: 1 or 0 (to leave)'
        ask
      end
    end
    ask
  end
end

# rubocop:enable Style/GlobalVars, Lint/NestedMethodDefinition, Metrics/MethodLength:
