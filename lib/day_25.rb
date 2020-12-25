require "set"

class Day25
  DIVISOR = 20201227

  def self.part_1(input=File.new("config/day_25.txt").read)
    public_key_1, public_key_2 = _parse_input(input)

    loop_size_1 = loop_size(public_key_1)
    loop_size_2 = loop_size(public_key_2)

    encryption_key(public_key_1, loop_size_2)
  end

  def self.part_2(input=File.new("config/day_25.txt").read)
  end

  def self.encryption_key(subject_number, loop_size)
    value = 1
    (1..loop_size).map do |loop_number|
      value *= subject_number
      value = value % DIVISOR
    end.last
  end

  def self.loop_size(public_id)
    subject_number = 7
    value = 1

    (1..).each do |loop_number|
      value *= subject_number
      value = value % DIVISOR
      return loop_number if value == public_id
    end
  end


  def self._parse_input(input)
    input.split("\n").map(&:to_i)
  end
end
