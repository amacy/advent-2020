class Day06
  def self.part_1(input=File.new("config/day_06.txt").read)
    answers = _parse_input(input).map do |answers|
      answers.gsub("\n", "").split("").uniq
    end

    answers.inject(0) do |sum, answer|
      sum += answer.length
    end
  end

  def self.part_2(input=File.new("config/day_06.txt").read)
    answers = _parse_input(input)
    total = 0

    answers.each do |answer|
      array = answer.split("\n")
      total_answers = array.length
      all_answers = array.join
      unique_answers = all_answers.split("").uniq

      unique_answers.each do |unique_answer|
        if all_answers.count(unique_answer) == total_answers
          total += 1
        end
      end
    end

    total
  end

  def self._parse_input(input)
    input.split("\n\n")
  end
end
