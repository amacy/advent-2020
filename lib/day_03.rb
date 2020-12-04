class Day03
  def self.part_1(input=File.new("config/day_03.txt").read)
    grid = _parse_input(input)
    right = 3
    down = 1

    _traverse_slope(grid, right, down)
  end

  def self.part_2(input=File.new("config/day_03.txt").read)
    grid = _parse_input(input)
    slopes = [
      [1, 1],
      [3, 1],
      [5, 1],
      [7, 1],
      [1, 2],
    ]

    slopes.inject(1) do |product, slope|
      product *= _traverse_slope(grid, *slope)
    end
  end

  def self._traverse_slope(grid, right, down)
    row_length = grid[0].length
    trees = 0
    total_right = right
    total_down = down

    loop do
      return trees if total_down >= grid.length

      if total_right >= row_length
        total_right = total_right - row_length
      end

      trees += 1 if grid[total_down][total_right] == "#"

      total_right += right
      total_down += down
    end

    trees
  end

  def self._parse_input(input)
    input.split("\n")
  end
end
