require_relative 'player'
require_relative 'die'
require_relative 'game_turn'
require_relative 'treasure_trove'

class Game
  attr_reader :title

  def initialize(title)
    @title = title
    @players = []
  end

  def load_players(from_file)
    File.readlines(from_file).each do |line|
      name, health = line.split(",")
      add_player(Player.new(name, Integer(health)))
    end
  end

  def add_player(player)
    @players << player
  end

  def play(rounds)
    puts "There are #{@players.size} players in #{title}.\n"
    puts @players

    treasures = TreasureTrove::TREASURES
    puts "\nThere are #{treasures.size} treasures to be found:"
    treasures.each do |treasure|
      puts "A #{treasure.name} is worth #{treasure.points} points"
    end
    1.upto(rounds) do |round|
      if block_given?
        break if yield
      end
      puts "\nRound #{round}:"
      @players.each do |player|
        GameTurn.take_turn(player)
        puts player
      end
    end
  end

  def print_name_and_health(player)
    puts "#{player.name} (#{player.health})"
  end

  def print_stats
    puts "\n#{@title}'s Statistics:"

    @players.each do |player|
      puts "\n#{player.name}'s point totals:"
      player.each_found_treasure do |treasure|
        puts "#{treasure.points} total #{treasure.name} points"
      end
      puts "#{player.points} grand total points"
    end

    puts "\n#{total_points} total points from treasures found"

    strong_players, wimpy_players = @players.partition { |player| player.strong? }

    puts "\n#{strong_players.size} strong players:"
    strong_players.each { |player| print_name_and_health(player) }

    puts "\n#{wimpy_players.size} wimpy players:"
    wimpy_players.each { |player| print_name_and_health(player) }

    puts "\n#{@title}'s High Scores:"
    @players.sort.each do |player|
      high_score_name = player.name.ljust(20, '.')
      puts "#{high_score_name} #{player.score}"
    end
  end

  def total_points
    @players.reduce(0) { |sum, player| sum + player.points }
  end
end
