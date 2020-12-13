class Day13
  def self.part_1(input=File.new("config/day_13.txt").read)
    timestamp, buses = _parse_input(input)
    buses.delete("x")
    delta = buses.max
    best_bus = nil

    buses.each do |bus|
      candidate = (0..timestamp + bus).step(bus).last - timestamp
      if candidate < delta
        delta = candidate
        best_bus = bus
      end
    end

    delta * best_bus
  end

  def self.part_2(input=File.new("config/day_13.txt").read, starting_point=100000000000000)
    _, buses = _parse_input(input)
    max = buses.select { |bus| bus != "x" }.max
    index_of_max = buses.index(max)
    if index_of_max > 0
      reversed_first_section = buses[0..index_of_max - 1].reverse
    else
      reversed_first_section = []
    end
    second_section = buses[index_of_max + 1..-1]

    (starting_point..).step(max) do |timestamp|
      if _check_first_section_timestamps(reversed_first_section, timestamp) &&
        _check_second_section_timestamps(second_section, timestamp)
        return timestamp - reversed_first_section.length
      end
    end
  end

  def self._check_first_section_timestamps(reversed_first_section, timestamp)
    reversed_first_section.each_with_index do |bus, index|
      next if bus == "x"
      return false if (timestamp - index - 1) % bus != 0
    end
    true
  end

  def self._check_second_section_timestamps(second_section, timestamp)
    second_section.each_with_index do |bus, index|
      next if bus == "x"
      return false if (timestamp + index + 1) % bus != 0
    end
    true
  end

  def self._parse_input(input)
    timestamp, buses = input.split("\n")
    buses = buses.split(",").map do |bus|
      if bus == "x"
        bus
      else
        bus.to_i
      end
    end
    [timestamp.to_i, buses]
  end
end
