require "set"

class Day21
  def self.part_1(input=File.new("config/day_21.txt").read)
    ingredients = _parse_input(input)
    allergens = _allergens(ingredients, Set.new)

    binding.pry
    (Set.new(ingredients.values.flatten.map(&:to_a).flatten.uniq) - allergens).count
  end

  def self.part_2(input=File.new("config/day_21.txt").read)
  end

  def self._allergens(last_ingredients, last_allergens)
    allergens = last_allergens.dup
    ingredients = last_ingredients.dup
    last_ingredients.each do |allergen, ingredients_array|
      result = Set.new
      binding.pry
      ingredients_array.each do |ingredient_set|
        binding.pry if ingredient_set.is_a?(String)
        remaining_ingredients = ingredient_set - allergens
        if result.empty?
          result = result.merge(remaining_ingredients)
        else
          result = result & remaining_ingredients
        end
        # this is broken
        ingredients[allergen] = remaining_ingredients
      end
      if result.length == 1
        allergens.merge(result)
      end
    end

    if allergens == last_allergens && ingredients == last_ingredients
      allergens
    else
      _allergens(ingredients, allergens)
    end
  end

  def self._parse_input(input)
    input.split("\n").inject({}) do |hash, line|
      ingredients, allergens = line.split(" (contains ")
      ingredients = Set.new(ingredients.split(" "))
      allergens.split(", ").each do |allergen|
        key = allergen.gsub(")", "")
        hash[key] ||= []
        hash[key] << ingredients
      end
      hash
    end
  end
end
