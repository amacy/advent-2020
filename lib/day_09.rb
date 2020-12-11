require "set"

class Day09
  Node = Struct.new(:operation, :argument, :executed)

  def self.part_1(input=File.new("config/day_09.txt").read, preamble=25)
    numbers = _parse_input(input)
    numbers[preamble..-1].each_with_index do |n, index|
      sums = _previous_sums(numbers, preamble, index + preamble)

      return n if !sums.include?(n)
    end
  end

  def self.part_2(input=File.new("config/day_09.txt").read)
  end

  def self._previous_sums(numbers, preamble, current_index)
    sums = Set.new
    previous_numbers_index_start = current_index - preamble
    previous_numbers_index_end = current_index - 1
    previous_numbers = numbers[previous_numbers_index_start..previous_numbers_index_end]

    previous_numbers.each_with_index do |x, x_index|
      (x_index + 1..previous_numbers.length - 1).each do |y_index|
        y = previous_numbers[y_index]
        sums << x + y
      end
    end

    sums
  end

  def self._parse_input(input)
    input.split("\n").map(&:to_i)
  end
end
