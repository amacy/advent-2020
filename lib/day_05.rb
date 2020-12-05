class Day05
  ROWS = 128
  COLUMNS = 8

  def self.part_1(input=File.new("config/day_05.txt").read)
    _calculate_seat_ids(_parse_input(input)).max
  end

  def self.part_2(input=File.new("config/day_05.txt").read)
    seat_ids = _calculate_seat_ids(_parse_input(input)).sort

    seat_ids.each_with_index do |seat_id, index|
      if seat_ids[index + 1] == seat_id + 2
        return seat_id + 1
      end
    end
  end

  def self._calculate_seat_ids(tickets)
    seat_ids = []

    tickets.each do |ticket|
      first_row = 0
      last_row = ROWS - 1
      first_column = 0
      last_column = COLUMNS - 1

      7.times do
        first_row, last_row = _half(ticket.shift, first_row, last_row)
      end
      raise "error calculating rows" if first_row != last_row

      3.times do
        first_column, last_column = _half(ticket.shift, first_column, last_column)
      end
      raise "errors calculating columns" if first_column != last_column

      seat_ids << first_row * 8 + first_column
    end

    seat_ids
  end

  def self._half(instruction, x, y)
    difference = y - x
    remainder = (difference / 2)

    if ["F", "L"].include?(instruction)
      if difference == 1
        [x, x]
      else
        [x, x + remainder]
      end
    elsif ["B", "R"].include?(instruction)
      if difference == 1
        [y, y]
      else
        remainder += 1 if remainder % 2 != 0
        [x + remainder, y]
      end
    else
      raise "invalid input"
    end
  end

  def self._parse_input(input)
    input.split("\n").map do |ticket|
      ticket.split("")
    end
  end
end

# 1, 64
# 32, 64
# 32, 48
# 40, 48
# 44, 48
# 44, 46
# 44, 45
#
#
# 0, 63
# 31, 63
# 31, 47
# 39, 47
# 43, 47
# 43, 45
# 43, 44
