require "set"

# this one really needs recursion
class Day18
  def self.part_1(input=File.new("config/day_18.txt").read)
    expressions = _parse_input(input)

    expressions.map do |expression|
      values = expression.split(/ /)
      current_total = values.shift.to_i
      next_value = nil
      symbol = nil
      sum = 0

      loop do
        symbol = values.shift.to_sym
        next_value = values.shift
        if next_value.include?("(")
          next_value = next_value[1..-1].to_i
          loop do
            next_symbol = values.shift.to_sym
            next_next_value = values.shift
            if next_next_value[-1] == ")"
              next_value = next_value.send(
                next_symbol,
                next_next_value[0..-2].to_i,
              )
              break
            else
              next_value = next_value.send(next_symbol, next_next_value.to_i)
            end
          end
        end
        current_total = current_total.send(symbol, next_value.to_i)
        break current_total if values.length == 0
      end
    end.sum
  end

  def self.part_2(input=File.new("config/day_18.txt").read)
  end

  def self._parse_input(input)
    input.split("\n")
  end
end
