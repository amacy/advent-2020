require "set"

class Day22
  class Player
    attr_reader :cards

    def initialize(cards)
      @cards = cards
    end

    def add_cards!(cards)
      @cards += cards
    end

    def remove_card!
      @cards.shift
    end

    def lost?
      @cards.empty?
    end
  end

  def self.part_1(input=File.new("config/day_22.txt").read)
    players = _parse_input(input)

    loop do
      puts players[0].cards.inspect
      puts players[1].cards.inspect
      cards = players.map(&:remove_card!)
      if cards[0] > cards[1]
        players[0].add_cards!(cards.sort.reverse)
      else
        players[1].add_cards!(cards.sort.reverse)
      end

      if players[0].lost?
        sum = 0
        players[1].cards.reverse.each_with_index do |card, index|
          sum += card * (index + 1)
        end
        return sum
      elsif players[1].lost?
        sum = 0
        players[0].cards.reverse.each_with_index do |card, index|
          sum += card * (index + 0)
        end
        return sum
      end
    end
  end

  def self.part_2(input=File.new("config/day_22.txt").read)
  end

  def self._parse_input(input)
    input.split("\n\n").map do |player|
      lines = player.split(/\n/)
      Player.new(
        lines[1..-1].map(&:to_i),
      )
    end
  end
end
