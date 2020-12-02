class Day02
  def self.part_1(input=File.new("config/day_02.txt").read)
    list = _parse_input(input)

    list.inject(0) do |sum, instructions|
      sum += 1 if valid_password?(*instructions)
      sum
    end
  end

  def self.valid_password?(range, letter, password)
    range.include?(password.count(letter))
  end

  # def self.part_2(input=File.new("config/day_02.txt").read)
  #   list = _parse_input(input)
  # end

  def self._parse_input(input)
    input.split("\n").map do |line|
      instructions = line.split(" ")

      # parse range
      range = instructions[0].split("-")
      instructions[0] = range[0].to_i..range[1].to_i

      # strip colon
      instructions[1] = instructions[1][0]

      instructions
    end
  end
end
