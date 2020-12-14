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

  def self.part_2(input=File.new("config/day_13.txt").read)
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
