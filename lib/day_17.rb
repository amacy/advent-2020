class Day17
  def self.part_1(input=File.new("config/day_17.txt").read)
    original_cubes = _parse_input(input)
    last_cubes = original_cubes.dup
    current_cubes = original_cubes.dup

    6.times do
      empty_slice = _empty_slice(last_cubes)
      current_cubes.unshift(empty_slice)
      current_cubes << empty_slice.map(&:dup)

      last_cubes.each_with_index do |slice, z|
        slice.each_with_index do |row, x|
          row.each_with_index do |cube, y|
          end
        end
      end
    end
  end

  def self.part_2(input=File.new("config/day_17.txt").read)
  end

  def self._empty_slice(cubes)
    length = cubes[0].length
    [["."] * length] * length
  end

  def self._add_inactive_cubes(current_cubes)
    padded_cubes = [
    ]
    (current_cubes.length + 2).times do

    end
    current_cubes.dup.each_with_index do |slice, z|
      slice.dup.each_with_index do |row, x|
        row.dup.each_with_index do |cube, y|
        end
      end
    end
  end

  def self._parse_input(input)
    [input.split("\n").map { |row| row.split("") }]
  end
end
