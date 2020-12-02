class Day02
  def self.part_1(input=File.new("config/day_02.txt").read)
    list = _parse_input(input)

    list.inject(0) do |sum, instructions|
      sum += 1 if valid_part_1_password?(*instructions)
      sum
    end
  end

  def self.valid_part_1_password?(range, letter, password)
    (range[0]..range[1]).include?(password.count(letter))
  end

  def self.part_2(input=File.new("config/day_02.txt").read)
    list = _parse_input(input)

    list.inject(0) do |sum, instructions|
      sum += 1 if valid_part_2_password?(*instructions)
      sum
    end
  end

  def self.valid_part_2_password?(indices, letter, password)
    x = password[indices[0] - 1]
    y = password[indices[1] - 1]

    if x == letter
      y != letter
    else
      y == letter
    end
  end

  def self._parse_input(input)
    input.split("\n").map do |line|
      instructions = line.split(" ")
      instructions[0] = instructions[0].split("-").map(&:to_i)
      instructions[1] = instructions[1][0]
      instructions
    end
  end
end
