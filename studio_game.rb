# studio_game.rb


class Player
  attr_accessor :name
  attr_reader :health

  def initialize(name, health=100)
    @name = name.capitalize
    @health = health
  end

  def to_s
    "I'm #{@name} with a health of #{@health} and a score of #{score}."
  end

  def blam
    @health -= 10
    puts "#{@name} got blammed!"
  end

  def name=(new_name)
    @name = new_name.capitalize
  end

  def w00t
    @health += 15
    puts "#{@name} got w00ted!"
  end

  def score
    @health + @name.length
  end
end

player1 = Player.new("moe")
player2 = Player.new("larry", 60)
player3 = Player.new("curly", 125)

players = [player1, player2, player3]

puts "There are #{players.size} players in the game.\n"

players.each do |player|
  puts player
end

# Print each player's health
players.each do |player|
  player.blam
  player.w00t
  player.w00t
  puts player
end

# Pop out curly and replace with Shemp
players.pop
players.push(Player.new("Shemp", 90))
puts players










