require "set"

class Day14
  def self.part_1(input=File.new("config/day_14.txt").read)
    _run_program(input) do |line, mask, bit_value, memory|
      mask.split("").each_with_index do |bit, index|
        next if bit == "X"
        bit_value[index] = bit
      end
      memory[line[0]] = bit_value
      memory
    end
  end

  def self.part_2(input=File.new("config/day_14.txt").read)
    _run_program(input, 2) do |line, mask, bit_value, memory|
      mask.split("").each_with_index do |bit, index|
        next if bit == "0"
        bit_value[index] = bit
      end

      bit_values = Set.new
      bit_values << bit_value
      loop do
        bit_values.dup.each do |bv|
          index = bv.index("X")
          if index
            bit_values.delete(bv)
            bv_1 = bv.dup
            bv_2 = bv.dup
            bv_1[index] = "0"
            bv_2[index] = "1"
            bit_values << bv_1
            bit_values << bv_2
          end
        end

        break if bit_values.select { |bv| bv.include?("X") }.length == 0
      end

      bit_values.each do |bv|
        memory[bv] = line[1].dup.to_i
      end
      memory
    end
  end

  def self._run_program(input, version=1)
    program = _parse_input(input)
    mask = nil
    memory = {}

    program.each do |line|
      case line[0]
      when "mask"
        mask = line[1]
      when /^mem/
        if version == 2
          value = line[0].match(/^mem\[(\d+)\]$/)[1].to_i
        else
          value = line[1].to_i
        end

        remainder = value.dup
        bit_value = "0" * 36

        if value > 0
          loop do
            (0..35).each do |exponent|
              product = 2**exponent
              if product == remainder
                bit_value.reverse!
                bit_value[exponent] = "1"
                bit_value.reverse!
                remainder = 0
                break
              elsif product > remainder
                bit_value.reverse!
                bit_value[exponent - 1] = "1"
                bit_value.reverse!
                remainder -= 2**(exponent - 1)
                break
              end
            end
            break if remainder <= 0
          end
        end
        memory = yield(line, mask, bit_value, memory)
      end
    end
    _sum_memory(memory, version)
  end

  def self._sum_memory(memory, version)
    if version == 2
      memory.values.inject(&:+)
    else
      memory.values.inject(0) do |sum, bit_value|
        sum += _bit_value_to_decimal(bit_value)
      end
    end
  end

  def self._bit_value_to_decimal(bit_value)
    sum = 0
    bit_value.reverse.split(//).map(&:to_i).each_with_index do |bit, index|
      if bit == 1
        sum += 2**index
      else
        sum
      end
    end
    sum
  end

  def self._parse_input(input)
    input.split("\n").map do |line|
      line.split(" = ")
    end
  end
end
