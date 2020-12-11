class Day08
  Node = Struct.new(:operation, :argument, :executed)

  def self.part_1(input=File.new("config/day_08.txt").read)
    instructions = _parse_input(input)
    _execute_instructions(instructions)[0]
  end

  def self.part_2(input=File.new("config/day_08.txt").read)
    original_instructions = _parse_input(input)
    index = 0

    loop do
      original_instructions.each do |node|
        node.executed = false
      end

      instructions = original_instructions.dup

      if instructions[index].operation == "nop"
        replaced_node = instructions[index]
        instructions[index] = Node.new("jmp", replaced_node.argument)
        index += 1
      elsif instructions[index].operation == "jmp"
        replaced_node = instructions[index]
        instructions[index] = Node.new("nop", replaced_node.argument)
        index += 1
      else
        index += 1
        next
      end

      acc, offset = _execute_instructions(instructions)

      if offset == original_instructions.length
        return acc
      end
    end
  end

  def self._execute_instructions(instructions)
    offset = 0
    acc = 0

    loop do
      node = instructions[offset]

      if node.nil? || node.executed
        return [acc, offset]
      end

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
  end

  def self._parse_input(input)
    input.split("\n").map do |line|
      operation, argument = line.split(" ")
      Node.new(operation, argument.to_i)
    end
  end
end
