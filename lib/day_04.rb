class Day04
  def self.part_1(input=File.new("config/day_04.txt").read)
    passports = _parse_input(input)
    required_keys = %w(byr iyr eyr hgt hcl ecl pid).sort
    count = 0

    passports.each do |passport|
      if (passport.keys - ["cid"]).sort == required_keys
        count += 1
      end
    end

    count
  end

  def self.part_2(input=File.new("config/day_04.txt").read)
  end

  def self._parse_input(input)
    input.split("\n\n").map do |passport|
      passport.split(/\s/).inject({}) do |hash, entry|
        key, value = entry.split(":")
        hash[key] = value
        hash
      end
    end
  end
end
