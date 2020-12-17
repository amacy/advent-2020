require "set"

class Day16
  def self.part_1(input=File.new("config/day_16.txt").read)
    notes = _parse_input(input)
    ranges = notes[0].map do |line|
      matches = line.match(/(\d+)-(\d+) or (\d+)-(\d+)/)
      [matches[1].to_i..matches[2].to_i, matches[3].to_i..matches[4].to_i]
    end.flatten

    invalid = []
    notes[2][1..-1].each do |line|
      values = line.split(",").map(&:to_i)
      values.each do |n|
        if ranges.select { |r| r.include?(n) }.empty?
          invalid << n
        end
      end
    end
    invalid.sum
  end

  def self.part_2(input=File.new("config/day_16.txt").read)
    notes = _parse_input(input)
  end

  def self._parse_input(input)
    input.split("\n\n").map do |section|
      section.split("\n")
    end
  end
end
