require "set"

class Day10
  def self.part_1(input=File.new("config/day_10.txt").read)
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

  def self.part_2(input=File.new("config/day_10.txt").read)
    adapters = SortedSet.new(_parse_input(input))
    last_voltage = 0
    optional = []

    loop do
      selected = adapters.select do |voltage|
        (last_voltage + 1..last_voltage + 3).include?(voltage)
      end

      puts selected.inspect
      if selected.length > 1
        optional += selected[0..-2]
      end

      last_voltage = selected.last
      puts last_voltage
      break if last_voltage == adapters.max
    end

    # none of optional & all of optional
    count = 2
    binding.pry
    1.upto(optional.length - 1).each do |combo_count|
      count += optional.combination(combo_count).count
    end
    count
  end

  def self._parse_input(input)
    input.split("\n").map(&:to_i).sort
  end
end
