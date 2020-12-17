require "set"

class Day16
  def self.part_1(input=File.new("config/day_16.txt").read)
    ranges, _, nearby_tickets = _parse_input(input)

    _invalid_values(ranges, nearby_tickets).sum
  end

  def self.part_2(input=File.new("config/day_16.txt").read)
    ranges, my_ticket, nearby_tickets = _parse_input(input)

    invalid_values = _invalid_values(ranges, nearby_tickets)
    valid_tickets = nearby_tickets.select do |ticket|
      invalid_values.each do |value|
        break false if ticket.include?(value)
      end
      true
    end

    tickets_data = {}

    ranges.each do |key, rs|
      rs.each do |range|
        valid_tickets.each_with_index do |ticket, index|
          ticket.each do |value|
            if range.include?(value)
              tickets_data[key] ||= {}
              tickets_data[key][index] ||= 0
              tickets_data[key][index] += 1
            end
          end
        end
      end
    end

    final_mapping = {}

    tickets_data.select do |key, index_count|
      index_count.each do |index, count|
        binding.pry
        if count == my_ticket.length
          final_mapping[key] = index
        end
      end
    end

    departure_keys = final_mapping.keys.select { |k| k.match(/^departure/) }
    departure_keys.map do |key|
      index = final_mapping[key]
      binding.pry
      my_ticket[index]
    end.inject(&:+)
  end

  def self._invalid_values(ranges, nearby_tickets)
    invalid = []
    nearby_tickets.each do |tickets|
      tickets.each do |n|
        if ranges.values.flatten.select { |r| r.include?(n) }.empty?
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

    ranges = notes[0].inject({}) do |hash, line|
      matches = line.match(/(\d+)-(\d+) or (\d+)-(\d+)/)
      key = line.split(":").first
      hash[key] = [matches[1].to_i..matches[2].to_i, matches[3].to_i..matches[4].to_i]
      hash
    end

    my_ticket = notes[1][1].split(",").map(&:to_i)

    nearby_tickets = notes[2][1..-1].map do |line|
      line.split(",").map(&:to_i)
    end

    [ranges, my_ticket, nearby_tickets]
  end
end
