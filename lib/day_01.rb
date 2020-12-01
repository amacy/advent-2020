class Day01
  def self.part_1(input=File.new("config/day_01.txt").read)
    list = _parse_input(input)

    loop do
      x = list.shift
      raise if x.nil?

      list.each do |y|
        return x * y if x + y == 2020
      end
    end
  end

  def self._parse_input(input)
    input.split("\n").map(&:to_i)
  end
end
