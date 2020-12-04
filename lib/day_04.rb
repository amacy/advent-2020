class Day04
  FIELDS = {
    "byr" => lambda { |v| (1920..2002).include?(v.to_i) },
    "iyr" => lambda { |v| (2010..2020).include?(v.to_i) },
    "eyr" => lambda { |v| (2020..2030).include?(v.to_i) },
    "hgt" => lambda { |v|
      case v[-2..-1]
      when "cm"
        (150..193).include?(v[0..-3].to_i)
      when "in"
        (59..76).include?(v[0..-3].to_i)
      else
        false
      end
    },
    "hcl" => lambda { |v| v.match?(/^#[a-f0-9]{6}$/) },
    "ecl" => lambda { |v| %w(amb blu brn gry grn hzl oth).include?(v) },
    "pid" => lambda { |v| v.match(/^\d{9}$/) },
  }

  def self.part_1(input=File.new("config/day_04.txt").read)
    passports = _parse_input(input)
    count = 0

    passports.each do |passport|
      if (passport.keys - ["cid"]).sort == FIELDS.keys.sort
        count += 1
      end
    end

    count
  end

  def self.part_2(input=File.new("config/day_04.txt").read)
    passports = _parse_input(input)
    count = 0

    passports.each do |passport|
      next if (passport.keys - ["cid"]).sort != FIELDS.keys.sort

      count += 1 if _matches_all_part_2_criteria?(passport)
    end

    count
  end

  def self._matches_all_part_2_criteria?(passport)
    FIELDS.each do |key, block|
      return false if !block.call(passport[key])
    end
    true
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
