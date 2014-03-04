class Character
  attr_accessor :name
  attr_accessor :hitpoints
  attr_accessor :strength
  attr_accessor :defense
  attr_accessor :experience
  attr_accessor :exp_reward

  def initialize(name, hitpoints, attack_strength, defense_strength, experience, exp_reward)
    @name = name
    @hitpoints = hitpoints
    @strength = attack_strength
    @defense = defense_strength
    @experience = experience
    @exp_reward = exp_reward
  end

  def print_message(message, delay=1)
    puts message
    sleep(delay)
  end

  def attack(opponent)
    unless (opponent.hitpoints <= 0) || (hitpoints <= 0)
      attack_value = rand(strength)
      damage_taken = attack_value - opponent.defense
      print_message "#{name} attacks #{opponent.name} for #{attack_value}..."
      if damage_taken <= 0
        print_message "#{opponent.name} takes no damage!", 0
      else
        if opponent.hitpoints >= damage_taken
          opponent.hitpoints -= damage_taken
        else
          opponent.hitpoints == 0
        end
        print_message "#{opponent.name} takes #{damage_taken} damage!"
        print_message "#{opponent.name}'s HP is now #{opponent.hitpoints}"
      end
    end
  end

end