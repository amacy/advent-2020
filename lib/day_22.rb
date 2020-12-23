require "set"

class Day22
  class Player
    attr_reader :cards

    def initialize(cards)
      @cards = cards
    end

    def add_cards!(card_1, card_2)
      @cards += [card_1, card_2]
    end

    def remove_card!
      @cards.shift
    end

    def lost?
      @cards.empty?
    end
  end

  class Game
    def self.play_sub_game!(player_1_cards, player_2_cards, total_game_numbers)
      Game.new(
        [Player.new(player_1_cards), Player.new(player_2_cards)],
        total_game_numbers + 1,
      ).play_sub_game!
    end

    def initialize(players, game_number)
      @players = players
      @game_number = game_number
      @total_games = game_number
      @turns = []
      # puts ""
      # puts "=== Game #{@game_number} ==="
    end

    def play_sub_game!
      _play!
    end

    def play!
      calculate_winning_score(_play!)
    end

    def _play!
      loop do
        # puts ""
        # puts "-- Round #{@turns.count + 1} (Game #{@game_number}) --"
        # puts "Player 1's deck: #{@players[0].cards.join(", ")}"
        # puts "Player 2's deck: #{@players[1].cards.join(", ")}"
        turn = @players.map(&:cards)
        if @turns.include?(turn.to_s)
          return 0
        else
          @turns << turn.to_s
        end

        cards = @players.map(&:remove_card!)
        # puts "Player 1 plays: #{cards[0]}"
        # puts "Player 2 plays: #{cards[1]}"
        if play_sub_game?(*cards)
          winner = self.class.play_sub_game!(
            @players[0].cards[0..cards[0] - 1],
            @players[1].cards[0..cards[1] - 1],
            @total_games,
          )
          @total_games += 1
          loser = winner == 1 ? 0 : 1
          @players[winner].add_cards!(cards[winner], cards[loser])
          # puts "Player #{winner + 1} wins round #{@turns.count} of game #{@game_number}"
        elsif cards[0] > cards[1]
          # puts "Player #{1} wins round #{@turns.count} of game #{@game_number}"
          @players[0].add_cards!(cards[0], cards[1])
        else
          # puts "Player #{2} wins round #{@turns.count} of game #{@game_number}"
          @players[1].add_cards!(cards[1], cards[0])
        end

        if @players[0].lost?
          return 1
        elsif @players[1].lost?
          return 0
        end
      end
    end

    def play_sub_game?(card_1, card_2)
      @players[0].cards.count >= card_1 &&
        @players[1].cards.count >= card_2
    end

    def calculate_winning_score(player_number)
      player = @players[player_number]
      sum = 0
      player.cards.reverse.each_with_index do |card, index|
        sum += card * (index + 1)
      end
      sum
    end
  end

  def self.part_1(input=File.new("config/day_22.txt").read)
    players = _parse_input(input)

    loop do
      cards = players.map(&:remove_card!)
      if cards[0] > cards[1]
        players[0].add_cards!(cards[0], cards[1])
      else
        players[1].add_cards!(cards[1], cards[0])
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
    players = _parse_input(input)
    Game.new(players, 1).play!
  end

  def self._parse_input(input)
    input.split("\n\n").map do |player|
      lines = player.split(/\n/)
      Player.new(lines[1..-1].map(&:to_i))
    end
  end
end
