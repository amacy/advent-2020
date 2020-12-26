class Day17
  ACTIVE = "#"
  INACTIVE = "."

  def self.part_1(input=File.new("config/day_17.txt").read)
    original_cubes = _parse_input(input)
    last_cubes = original_cubes.dup
    current_cubes = original_cubes.dup

    6.times do
      current_cubes = _add_rows_and_columns(current_cubes)
      empty_slice = _empty_slice(last_cubes)
      current_cubes.unshift(empty_slice)
      current_cubes << empty_slice.map(&:dup)

      last_cubes.each_with_index do |slice, z|
        slice.each_with_index do |row, x|
          row.each_with_index do |cube, y|
            count = _neighbors(x, y, z).select do |neighbor|
              _x, _y, _z = neighbor
              _slice = last_cubes[_z]
              # should this be needed?
              if _slice
                _row = _slice[_x]
                if _row
                  if _row[_y]
                    _cube = _row[_y]
                  end
                end
              end
              _cube && _cube == ACTIVE
            end.count

            puts count
            if cube == ACTIVE
              if ![2, 3].include?(count)
                # add 1 to compesnate for now row, column & slice
                current_cubes[z + 1][x + 1][y + 1] = INACTIVE
              end
            else
              if count == 3
                # never gets here
                binding.pry
                current_cubes[z + 1][x + 1][y + 1] = ACTIVE
              end
            end
          end
        end
      end
    end

    # don't have a proper cube here
    binding.pry
    current_cubes.flatten.count(ACTIVE)
  end

  def self.part_2(input=File.new("config/day_17.txt").read)
  end

  def self._neighbors(x, y, z)
    neighbors = [
      [x, y, z + 1],
      [x, y, z - 1],
      [x, y + 1, z],
      [x, y - 1, z],
      [x, y + 1, z + 1],
      [x, y + 1, z - 1],
      [x, y - 1, z + 1],
      [x, y - 1, z - 1],
      [x + 1, y, z + 1],
      [x + 1, y, z - 1],
      [x - 1, y, z + 1],
      [x - 1, y, z - 1],
      [x + 1, y + 1, z],
      [x + 1, y - 1, z],
      [x - 1, y + 1, z],
      [x - 1, y - 1, z],
      [x + 1, y + 1, z + 1],
      [x + 1, y - 1, z - 1],
      [x - 1, y + 1, z + 1],
      [x - 1, y - 1, z - 1],
    ]
  end

  def self._empty_slice(cubes)
    length = cubes[0].length
    [[INACTIVE] * length] * length
  end

  def self._add_rows_and_columns(current_cubes)
    result = []
    current_cubes.each_with_index do |slice, z|
      result[z] = []
      slice.each_with_index do |row, x|
        result[z][x] = [INACTIVE] + row + [INACTIVE]
      end
    end

    result.map do |slice|
      [[INACTIVE] * slice.length] +
        slice +
        [[INACTIVE] * slice.length]
    end
  end

  def self._parse_input(input)
    [input.split("\n").map { |row| row.split("") }]
  end
end
