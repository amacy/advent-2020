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

  def self.part_2(input=File.new("config/day_01.txt").read)
    list = _parse_input(input)
    x_index = 0
    loop do
      x = list[x_index]
      raise if x.nil?

      list[1..-1].each_with_index do |y, y_index|
        if x + y < 2020

          list[y_index + 1..-1].each do |z|
            if x + y + z == 2020
              return x * y * z
            end
          end
        end
      end

      x_index += 1
    end
  end

  def self._parse_input(input)
    input.split("\n").map(&:to_i)
  end
end
