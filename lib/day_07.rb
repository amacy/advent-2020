class Day07
  MY_BAG = "shiny gold"

  Bag = Struct.new(:name, :contents)

  def self.part_1(input=File.new("config/day_07.txt").read)
    bags = _parse_input(input)
    count = 0

    bags.each do |_, bag|
      if bag.contents.keys.include?(MY_BAG)
        count += 1
        next
      else
        result = _navigate_bags(bags, bag.contents)
        if result == 1
          count += 1
          next
        end
      end
    end

    count
  end

  def self.part_2(input=File.new("config/day_07.txt").read)
  end

  def self._navigate_bags(bags, bag_contents)
    bag_contents.each do |inner_bag_name, _|
      if !bags[inner_bag_name]
        next
      elsif bags[inner_bag_name].contents.keys.include?(MY_BAG)
        return 1
      else
        result = _navigate_bags(bags, bags[inner_bag_name].contents)
        return result if result == 1
        result
      end
    end
    0
  end

  def self._parse_input(input)
    input.split("\n").inject({}) do |nodes, line|
      bag = _generate_bag(*line.split(" bags contain "))
      nodes[bag.name] = bag
      nodes
    end
  end

  def self._generate_bag(bag_name, contents)
    if contents == "no other bags."
      Bag.new(bag_name, {})
    else
      parsed_contents = contents.split(", ").inject({}) do |hash, _bag_name|
        matches = /^(\d) (\w+ \w+)/.match(_bag_name)

        count = matches[1]
        _bag_name = matches[2]

        hash[_bag_name] = count
        hash
      end

      Bag.new(bag_name, parsed_contents)
    end
  end
end
