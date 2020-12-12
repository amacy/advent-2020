class Day12
  def self.part_1(input=File.new("config/day_12.txt").read)
    instructions = _parse_input(input)
    x = 0
    y = 0
    direction = "E"

    instructions.each do |instruction|
      action = instruction[0]
      value = instruction[1..-1].to_i

      x, y, direction = _evasive_action(x, y, direction, action, value)
    end

    x.abs + y.abs
  end

  def self.part_2(input=File.new("config/day_12.txt").read)
    instructions = _parse_input(input)
    ship_x = 0
    ship_y = 0
    direction = "E"

    waypoint_relative_x = 10
    waypoint_relative_y = 1

    instructions.each do |instruction|
      action = instruction[0]
      value = instruction[1..-1].to_i

      if action == "F"
        x_delta = value * waypoint_relative_x
        x_direction = x_delta > 0 ? "E" : "W"
        ship_x, ship_y, direction = _evasive_action(ship_x, ship_y, direction, x_direction, x_delta.abs)

        y_delta = value * waypoint_relative_y
        y_direction = y_delta > 0 ? "N" : "S"
        ship_x, ship_y, direction = _evasive_action(ship_x, ship_y, direction, y_direction, y_delta.abs)
      else
        waypoint_relative_x, waypoint_relative_y = _move_waypoint(
          waypoint_relative_x,
          waypoint_relative_y,
          action,
          value,
        )
      end
    end

    ship_x.abs + ship_y.abs
  end

  def self._move_waypoint(x, y, action, value)
    case action
    when "N"
      y += value
    when "S"
      y -= value
    when "E"
      x += value
    when "W"
      x -= value
    when "L"
      value -= 90
      next_x = -y
      next_y = x
      x = next_x
      y = next_y
      if value > 0
        x, y = _move_waypoint(x, y, action, value)
      end
    when "R"
      value -= 90
      next_x = y
      next_y = -x
      x = next_x
      y = next_y
      if value > 0
        x, y = _move_waypoint(x, y, action, value)
      end
    end

    [x, y]
  end

  def self._evasive_action(x, y, direction, action, value)
    case action
    when "N"
      y += value
    when "S"
      y -= value
    when "E"
      x += value
    when "W"
      x -= value
    when "L"
      case direction
      when "N"
        direction = "W"
      when "S"
        direction = "E"
      when "E"
        direction = "N"
      when "W"
        direction = "S"
      end
      value -= 90
      if value > 0
        x, y, direction = _evasive_action(x, y, direction, action, value)
      end
    when "R"
      case direction
      when "N"
        direction = "E"
      when "S"
        direction = "W"
      when "E"
        direction = "S"
      when "W"
        direction = "N"
      end
      value -= 90
      if value > 0
        x, y, direction = _evasive_action(x, y, direction, action, value)
      end
    when "F"
      x, y, direction = _evasive_action(x, y, direction, direction, value)
    end

    [x, y, direction]
  end

  def self._parse_input(input)
    input.split("\n")
  end
end
