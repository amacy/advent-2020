require "set"

class Day15
  INPUT = "16,11,15,0,1,7"
  def self.part_1(input=INPUT)
    _solve(input, 2020)
  end

  def self.part_2(input=INPUT)
    _solve(input, 30000000)
  end

  def self._solve(input, total_turns)
    turns = _parse_input(input)

    turn_history = {}
    turns.each_with_index do |turn, index|
      turn_history[turn] ||= []
      turn_history[turn] << index + 1
    end

    (turns.length + 1..total_turns).each do |index|
      last_number = turns[-1]

      if turn_history[last_number].length == 1
        current_number = 0
      else
        current_number = turn_history[last_number][-1] - turn_history[last_number][-2]
      end

      turn_history[current_number] ||= []
      turn_history[current_number] << index
      turns << current_number
    end

    turns.last
  end

  def self._parse_input(input)
    input.split(",").map(&:to_i)
  end
end
