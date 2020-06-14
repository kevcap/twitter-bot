# rubocop:disable Style/GlobalVars, Lint/NestedMethodDefinition, Metrics/MethodLength, Metrics/PerceivedComplexity:
require 'Twitter'

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
      p "Do you have your own keys to Twitter API [1] or You'll use ours instead [2], type [0] to leave"
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
        print 'is that Correct? [Y]es [N]o: [0] to leave'
        check_if_config_is_ok = gets.chomp.upcase
        if check_if_config_is_ok == 'Y'
          $valid = true
        else
          p "You typed neither 'N' or an answer which is not Y, lets try again "
          ask
        end
      elsif answer == 2
        $config = {
          consumer_key: 't01QK9KnKcMdTJxWhfmw8iyiu',
          consumer_secret: 'LieYtk811T8k8FxAEkJSmX3SN5vlJF5dinLmmqi3xZFaklmwPP',
          access_token: '1270731742870110208-sILb7qIHfiZpYXou4TEgr3GMgI4TA4',
          access_token_secret: 'K2tNXkdtsH4ecUQubaS8guXCxDFSEqcCEnNoUagedOX6z'
        }
        p "Your config is: #{$config}"
        $valid = true
      elsif answer.zero?
        exit
      else
        p 'Please, type a valid answer: 1, 2 or 0 to leave'
        ask
      end
    end
    ask
  end
end

# rubocop:enable Style/GlobalVars, Lint/NestedMethodDefinition, Metrics/MethodLength, Metrics/PerceivedComplexity:
