require "set"

class Day16
  def self.part_1(input=File.new("config/day_16.txt").read)
    key_to_ranges, _, nearby_tickets = _parse_input(input)

    _invalid_values(key_to_ranges, nearby_tickets).sum
  end

  def self.part_2(input=File.new("config/day_16.txt").read)
    key_to_ranges, my_ticket, nearby_tickets = _parse_input(input)

    invalid_values = _invalid_values(key_to_ranges, nearby_tickets)
    valid_tickets = nearby_tickets.select do |ticket|
      invalid_values.each do |value|
        break false if ticket.include?(value)
      end
      true
    end

    ticket_data = key_to_ranges.inject({}) do |hash, (key, ranges)|
      hash[key] ||= {}
      valid_tickets.each_with_index do |ticket, ticket_number|
        ticket.each_with_index do |value, position|
          hash[key][position] ||= Set.new
          ranges.each do |range|
            hash[key][position] << ticket_number if range.include?(value)
          end
        end
      end
      hash
    end

    final_mapping = ticket_data.inject({}) do |hash, (key, position_to_ticket_indices)|
      position_to_ticket_indices.each do |position, indices|
        if indices.count == my_ticket.count
          hash[key] = position
        end
      end
      hash
    end
    binding.pry

    departure_keys = final_mapping.keys.select { |k| k.match(/^departure/) }
    departure_keys.map do |key|
      index = final_mapping[key]
      my_ticket[index]
    end.inject(&:+)
  end

  def self._invalid_values(key_to_ranges, nearby_tickets)
    invalid = []
    nearby_tickets.each do |tickets|
      tickets.each do |n|
        if key_to_ranges.values.flatten.select { |r| r.include?(n) }.empty?
          invalid << n
        end
      end
    end
    invalid
  end

  def self._parse_input(input)
    notes = input.split("\n\n").map do |section|
      section.split("\n")
    end

    key_to_ranges = notes[0].inject({}) do |hash, line|
      matches = line.match(/(\d+)-(\d+) or (\d+)-(\d+)/)
      key = line.split(":").first
      hash[key] = [matches[1].to_i..matches[2].to_i, matches[3].to_i..matches[4].to_i]
      hash
    end

    my_ticket = notes[1][1].split(",").map(&:to_i)

    nearby_tickets = notes[2][1..-1].map do |line|
      line.split(",").map(&:to_i)
    end

    [key_to_ranges, my_ticket, nearby_tickets]
  end
end
