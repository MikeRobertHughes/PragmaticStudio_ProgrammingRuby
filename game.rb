require_relative 'player'
require_relative 'die'
require_relative 'game_turn'

class Game
  attr_reader :title

  def initialize(title)
    @title = title
    @players = []
  end

  def add_player(player)
    @players << player
  end

  def play(rounds)
    puts "There are #{@players.size} players in #{title}.\n"
    puts @players

    1.upto(rounds) do |round|
      puts "\nRound #{round}:"
      @players.each do |player|
        GameTurn.take_turn(player)
        puts player
      end
    end
  end

  def print_stats
    puts "\n#{@title}'s Statistics:"

    strong_players, wimpy_players = @players.partition { |player| player.strong? }

    puts "\n#{strong_players.size} strong players:"
    strong_players.each { |player| puts "#{player.name} (#{player.health})"}

    puts "\n#{wimpy_players.size} wimpy players:"
    wimpy_players.each { |player| puts "#{player.name} (#{player.health})" }

    sorted_players = @players.sort { |a, b| b.score <=> a.score }

    puts "\n#{@title}'s High Scores:"
    sorted_players.each do |player|
      high_score_name = player.name.ljust(20, '.')
      puts "#{high_score_name} #{player.score}"
    end
  end
end
