class Day10
  def self.part_1(input=File.new("config/day_10.txt").read, preamble=25)
    adapters = _parse_input(input)
    one_jolt_diff = 0
    three_jolt_diff = 1

    adapters.each_with_index do |voltage, index|
      if index == 0
        diff = voltage - 0
      else
        diff = voltage - adapters[index - 1]
      end

      if diff == 1
        one_jolt_diff += 1
      else
        three_jolt_diff += 1
      end
    end

    one_jolt_diff * three_jolt_diff
  end

  def self.part_2(input=File.new("config/day_10.txt").read, preamble=25)
  end

  def self._parse_input(input)
    input.split("\n").map(&:to_i).sort
  end
end
