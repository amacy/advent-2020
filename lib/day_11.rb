class Day11
  FLOOR = "."
  EMPTY = "L"
  OCCUPIED = "#"

  def self.part_1(input=File.new("config/day_11.txt").read)
    layout = _parse_input(input)
    previous_layout = layout.dup
    current_layout = layout.dup
    row_count = layout.length
    column_count = layout.first.length

    loop do
      previous_layout.each_with_index do |row, row_number|
        row.each_with_index do |space, column_number|
          next if space == FLOOR

          neighbor_coords = [
            [row_number + 1, column_number],
            [row_number + 1, column_number + 1],
            [row_number + 1, column_number - 1],
            [row_number - 1, column_number],
            [row_number - 1, column_number + 1],
            [row_number - 1, column_number - 1],
            [row_number, column_number - 1],
            [row_number, column_number + 1],
          ]
          selected_neighbor_coords = neighbor_coords.select do |neighbor|
            (0..row_count - 1).include?(neighbor[0]) &&
              (0..column_count - 1).include?(neighbor[1])
          end

          neighbors = selected_neighbor_coords.map do |coord|
            binding.pry if previous_layout[coord[0]].nil?
            previous_layout[coord[0]][coord[1]]
          end

          if space == EMPTY && neighbors.count(OCCUPIED) == 0
            new_row = current_layout[row_number].dup
            new_row[column_number] = OCCUPIED
            current_layout[row_number] = new_row
          elsif space == OCCUPIED && neighbors.count(OCCUPIED) >= 4
            new_row = current_layout[row_number].dup
            new_row[column_number] = EMPTY
            current_layout[row_number] = new_row
          end
        end
      end

      if current_layout == previous_layout
        occupied_seats = current_layout.inject(0) do |sum, row|
          sum += row.count(OCCUPIED)
        end
        return occupied_seats
      else
        previous_layout = current_layout.dup
      end
    end
  end

  def self.part_2(input=File.new("config/day_11.txt").read)
  end

  def self._parse_input(input)
    input.split("\n").map do |row|
      row.split(//).freeze
    end
  end
end
