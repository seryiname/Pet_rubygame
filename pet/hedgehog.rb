class Hedgehog < Pet

    RANDOM_PHRASES = [
      ['What the noice? Someone wants to offend us. Fshhh fshhh, we will prick him with thorns'],
      ['I want you to stroke my tummy'],
      ['We need to talk seriously. Feed me'] 
    ].freeze
  
    def play
      @response <<  'you throw the ball and your hedgehog rolls it for you'
      @response <<  'uffff uffff it is very good'
      super
    end
  
    def voice
      @response << 'fshhh, fshhh, fshhh'
      @emoji = '&#128515;'
      lower_states
      check
      save
    end
  
    def love
      @response << 'Your hedgehog turned on its back. Stroke his tummy'
      @response <<  'uffff uffff, kaefff'
      @emoji = '&#128536;'
      lower_states
      check
      save
    end
  
    def toilet
      @response << 'take the hedgehog to the toilet' if @need_toilet
      super
    end
  
    def random
      @response << RANDOM_PHRASES.sample
      @emoji = '&#128520;'
      lower_states
      check
      save
    end
      
    def reset(user_login)
      return puts("not_allowed".red) unless is_user_mainadmin?(user_login)
      self.class.new(self.name, self.user_login)
    end
  
    def change_type(user_login)
      return puts("not_allowed".red) unless is_user_admin?(user_login)
      Hedgehog.new(self.name)
    end
  end