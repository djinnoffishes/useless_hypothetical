class Battle

  def initialize(character_one, character_two)
    @character_one = character_one
    @character_two = character_two
  end

  def execute
    battle_over = false

    # main loop
    while !battle_over do
      if @character_one.hitpoints <= 0
        battle_over = true
        @character_two.experience += @character_one.exp_reward
        print "The #{@character_two.name} wins!\n#{@character_two.name} gains #{@character_one.exp_reward} experience!\n"
      elsif @character_two.hitpoints <= 0
        battle_over = true
        print "The #{@character_one.name} wins!\n#{@character_one.name} gains #{@character_two.exp_reward} experience!\n"
      end
      @character_one.attack(@character_two)
      @character_two.attack(@character_one)
    end
  end

end

def run_sample_battle
  # (name, hitpoints, attack_strength, defense_strength, experience, exp_reward)
  monster = Character.new  "Dragon", 100, 30, 10, 0, 20
  hero = Character.new "Paladin", 200, 55, 30, 0, 35
  battle = Battle.new hero, monster
  battle.execute
end
