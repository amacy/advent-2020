require "set"

class Day19
  Rule = Struct.new(:number, :children, :value, :length, :result)

  def self.part_1(input=File.new("config/day_19.txt").read)
    rules, messages = _parse_input(input)
    rule_zero = rules[0]

    results = rule_zero.children.flatten.map do |index|
      rules[index].result = _find_value(rules, index)
    end

    #  ["a",
    #  [[[["a", "a"], ["b", "b"]], [["a", "b"], ["b", "a"]]],
    #  [[["a", "b"], ["b", "a"]], [["a", "a"], ["b", "b"]]]],
    #  "b"]
    #
    # valid_messages = Set.new
    # results.inject("") do |acc, result|
    # end
    # length = results.inject(0) do |sum, result|
    #   sum += result.length
    # end
    # binding.pry
    # a=_convert_to_strings([], results, "")
    #
    # binding.pry; ""
    binding.pry

    # need a strategy to choose the correct length for rule 1

    # messages.select do |message|
    #   results.each do |result|
    #     if result.is_a?(String)
    #
    #     end
    #   end
    # end
  end

  def self.part_2(input=File.new("config/day_19.txt").read)
  end

  # def self._convert_to_strings(acc, data, string)
  #   if data.is_a?(String)
  #     string << data
  #   else
  #     if data.length == 2
  #     else
  #       data.map do |section|
  #         _convert_to_strings(acc, section)
  #       end
  #     end
  #   end
  #   acc
  # end

  def self._find_value(rules, index)
    rule = rules[index]
    if ["a", "b"].include?(rule.value)
      rule.value
    else
      rule.children.map do |indices|
        indices.map do |index|
          _find_value(rules, index)
        end
      end
    end
  end

  def self._parse_input(input)
    rules, messages = input.split("\n\n").map do |section|
      section.split("\n")
    end

    queue = []

    rule_to_number = rules.inject({}) do |hash, rule|
      number, remainder = rule.split(":")
      if remainder.match(/(a|b)/)
        value = remainder.match(/(a|b)/)[1]
        hash[value] = number
      else
        queue << [number.dup, remainder.dup]
      end
    end

    while queue.length > 0 do
      number, rule = queue.shift
      rule_to_number.map do |_rule, _number|
        rule.gsub!(_number, _rule)
      end

      if rule.match(/[0-9]/)
        queue << [number, rule]
      else
        rule_to_numnber[rule] = number
      end
    end

    [rules, messages]
  end
end
