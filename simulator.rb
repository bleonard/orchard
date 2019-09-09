require "./orchard"

class Simulator
  class << self
    def go!
      Simulator.new.run!
    end

    def single!
      Simulator.new(count: 1, log_game: true).run!
    end

    def try_all!
      strategies = [:most, :random, :least]
      counts = [2, 1]

      strategies.each do |basket_strategy|
        counts.each do |basket_count|
          Simulator.new(basket_strategy: basket_strategy, basket_count: basket_count).run!
          puts ""
        end
      end
    end
  end

  def initialize(basket_strategy: :most, basket_count: 2, count: 100000, log_game: false)
    @count = count
    @basket_strategy = basket_strategy # least, random, single
    @basket_count = basket_count
    @log_game = log_game
  end

  def run!
    winners = Hash.new(0)
    @count.times do
      game = Orchard.new(basket_strategy: @basket_strategy, basket_count: @basket_count)
      game.play!(@log_game)
      winner = game.winner
      winners[winner] += 1
    end

    players = winners[:players]
    bird = winners[:bird]
    percent = players.to_f / @count * 100

    if @count == 1
      puts "Winner: #{winners.keys.first}"
    else
      puts "Wins (Strategy: #{@basket_strategy}, Basket Count: #{@basket_count})"
      puts "Players: #{players}"
      puts "Bird   : #{bird}"
      puts "Percent: #{percent.round(1)}%"
    end
  end
end