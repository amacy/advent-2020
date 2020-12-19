require "set"

class Day14
  def self.part_1(input=File.new("config/day_14.txt").read)
  end

  def self.part_2(input=File.new("config/day_14.txt").read)
  end

  def self._parse_input(input)
    input.split("\n").map do |line|
      line.split(" = ")
    end
  end
end
