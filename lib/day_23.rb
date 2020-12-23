require "set"

class Day23
  def self.part_1(input="598162734")
    cups = _parse_input(input)
    current_cup_index = 0
    current_cup, picked_cups, remainder, destination_cup = _organize_cups(
      cups,
      current_cup_index,
    )

    10.times do |move_number|
      puts " -- move #{move_number + 1} --"
      cups_string = cups.join(" ").gsub(current_cup.to_s, "(" + current_cup.to_s + ")")
      puts "cups: #{cups_string}"
      puts "pick up: #{picked_cups.join(", ")}"
      puts "destination: #{destination_cup}"

      cups = _move_cups(cups, current_cup, picked_cups, remainder, destination_cup)

      current_cup_index += 1
      current_cup_index = 0 if current_cup_index == cups.length

      current_cup, picked_cups, remainder, destination_cup = _organize_cups(
        cups,
        current_cup_index,
      )
    end

    index = cups.index(1)
    if index == 0
      cups[1..-1].join.to_i
    else
      (cups[index + 1..-1] + cups[0..index - 1]).join.to_i
    end
  end

  def self.part_2(input="598162734")
  end

  def self._organize_cups(cups, current_cup_index)
    current_cup = cups[current_cup_index]
    if current_cup_index == 0
      [current_cup, cups[1..3], cups[4..-1], current_cup - 1]
    elsif current_cup_index == cups.length - 1
      [current_cup, cups[0..2], cups[3..-2], current_cup - 1]
    else
      picked_cups = cups[current_cup_index + 1..current_cup_index + 3]
      [
        current_cup,
        picked_cups,
        cups - picked_cups,
        current_cup - 1,
      ]
    end
  end

  def self._move_cups(cups, current_cup, picked_cups, remainder, last_destination_cup)
    destination_cup = last_destination_cup - 1

    if destination_cup < picked_cups.min && destination_cup < remainder.min
      _move_cups(
        cups,
        current_cup,
        picked_cups,
        remainder,
        (picked_cups + remainder).max,
      )
    elsif picked_cups.include?(destination_cup)
      _move_cups(cups, current_cup, picked_cups, remainder, destination_cup)
    else
      remaining_cups = cups - picked_cups
      destination_index = remaining_cups.index(destination_cup)

      binding.pry if destination_cup == 2
      remaining_cups[0..destination_index] +
        picked_cups +
        remaining_cups[destination_index + 1..-1]
    end
  end

  def self._parse_input(input)
    input.split("").map(&:to_i)
  end
end
