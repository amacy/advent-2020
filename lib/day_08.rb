class Day08
  Node = Struct.new(:operation, :argument, :executed)

  def self.part_1(input=File.new("config/day_08.txt").read)
    instructions = _parse_input(input)
    offset = 0
    acc = 0
    loop do
      node = instructions[offset]

      break if node.executed

      case node.operation
      when "nop"
        offset += 1
      when "acc"
        offset += 1
        acc += node.argument
      when "jmp"
        offset += node.argument
      end
      node.executed = true
    end

    acc
  end

  def self.part_2(input=File.new("config/day_08.txt").read)
  end

  def self._parse_input(input)
    input.split("\n").map do |line|
      operation, argument = line.split(" ")
      Node.new(operation, argument.to_i)
    end
  end
end
