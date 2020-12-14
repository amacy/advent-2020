class Day11
  FLOOR = "."
  EMPTY = "L"
  OCCUPIED = "#"

  def self.part_1(input=File.new("config/day_11.txt").read)
    _change_seats(input, 4) do |row_number, column_number, previous_layout|
      row_count = previous_layout.length
      column_count = previous_layout.first.length

      coords = [
        [row_number + 1, column_number],
        [row_number + 1, column_number + 1],
        [row_number + 1, column_number - 1],
        [row_number - 1, column_number],
        [row_number - 1, column_number + 1],
        [row_number - 1, column_number - 1],
        [row_number, column_number - 1],
        [row_number, column_number + 1],
      ]
      coords.select do |neighbor|
        (0..row_count - 1).include?(neighbor[0]) &&
          (0..column_count - 1).include?(neighbor[1])
      end
    end
  end

  def self.part_2(input=File.new("config/day_11.txt").read)
    _change_seats(input, 5) do |row_number, column_number, previous_layout|
      row_count = previous_layout.length
      column_count = previous_layout.first.length

      possible_coords = []

      possible_rows = (0..row_count - 1).to_a
      possible_columns = (0..column_count - 1).to_a

      # up
      if row_number > 0
        possible_coords << possible_rows[0..row_number - 1].reverse.map do |row|
          [row, column_number]
        end
      end

      # down
      if row_number < row_count - 1
        possible_coords << possible_rows[row_number + 1..-1].map do |row|
          [row, column_number]
        end
      end

      # left
      if column_number > 0
        possible_coords << possible_columns[0..column_number - 1].reverse.map do |column|
          [row_number, column]
        end
      end

      # right
      if column_number < column_count - 1
        possible_coords << possible_columns[column_number + 1..-1].map do |column|
          [row_number, column]
        end
      end

      # diagonals
      if row_number > 0 && column_number > 0
        upper_left = []
        (1..[row_number, column_number].min).each do |offset|
          upper_left << [row_number - offset, column_number - offset]
        end
        possible_coords << upper_left
      end

      if row_number > 0 && column_number < column_count - 1
        upper_right = []
        (1..[row_number, column_count - column_number - 1].min).each do |offset|
          upper_right << [row_number - offset, column_number + offset]
        end
        possible_coords << upper_right
      end

      if row_number < row_count - 1 && column_number > 0
        lower_left = []
        (1..[row_count - row_number - 1, column_number].min).each do |offset|
          lower_left << [row_number + offset, column_number - offset]
        end
        possible_coords << lower_left
      end

      if row_number < row_count - 1 && column_number < column_count - 1
        lower_right = []
        (1..[row_count - row_number - 1, column_count - column_number - 1].min).each do |offset|
          lower_right << [row_number + offset, column_number + offset]
        end
        possible_coords << lower_right
      end

      selected_coords = []

      possible_coords.each do |direction|
        direction.each do |coords|
          if previous_layout[coords[0]][coords[1]] != FLOOR
            selected_coords << coords
            break
          end
        end
      end

      selected_coords
    end
  end

  def self._change_seats(input, max_neighbors)
    layout = _parse_input(input)
    previous_layout = layout.dup
    current_layout = layout.dup

    loop do
      previous_layout.each_with_index do |row, row_number|
        row.each_with_index do |space, column_number|
          next if space == FLOOR

          selected_coords = yield(row_number, column_number, previous_layout)
          neighbors = selected_coords.map do |coord|
            previous_layout[coord[0]][coord[1]]
          end

          if space == EMPTY && neighbors.count(OCCUPIED) == 0
            new_row = current_layout[row_number].dup
            new_row[column_number] = OCCUPIED
            current_layout[row_number] = new_row
          elsif space == OCCUPIED && neighbors.count(OCCUPIED) >= max_neighbors
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

  def self._parse_input(input)
    input.split("\n").map do |row|
      row.split(//).freeze
    end
  end
end
