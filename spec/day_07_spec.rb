require_relative "../lib/day_07"
require "pry"

RSpec.describe Day07 do
  context "part 1" do
    it "calculates the correct answer for the sample input" do
      input = <<~INPUT
        light red bags contain 1 bright white bag, 2 muted yellow bags.
        dark orange bags contain 3 bright white bags, 4 muted yellow bags.
        bright white bags contain 1 shiny gold bag.
        muted yellow bags contain 2 shiny gold bags, 9 faded blue bags.
        shiny gold bags contain 1 dark olive bag, 2 vibrant plum bags.
        dark olive bags contain 3 faded blue bags, 4 dotted black bags.
        vibrant plum bags contain 5 faded blue bags, 6 dotted black bags.
        faded blue bags contain no other bags.
        dotted black bags contain no other bags.
      INPUT

      expect(Day07.part_1(input)).to eq 4
    end

    it "calculates the correct answer for the input file" do
      expect(Day07.part_1).to eq 378
    end
  end

  # context "part 2" do
  #   it "calculates the correct answer for the sample input" do
  #     input = <<~INPUT
  #       light red bags contain 1 bright white bag, 2 muted yellow bags.
  #       dark orange bags contain 3 bright white bags, 4 muted yellow bags.
  #       bright white bags contain 1 shiny gold bag.
  #       muted yellow bags contain 2 shiny gold bags, 9 faded blue bags.
  #       shiny gold bags contain 1 dark olive bag, 2 vibrant plum bags.
  #       dark olive bags contain 3 faded blue bags, 4 dotted black bags.
  #       vibrant plum bags contain 5 faded blue bags, 6 dotted black bags.
  #       faded blue bags contain no other bags.
  #       dotted black bags contain no other bags.
  #     INPUT
  #
  #     expect(Day07.part_2(input)).to eq 6
  #   end
  #
  #   it "calculates the correct answer for the input file" do
  #     expect(Day07.part_2).to eq 3221
  #   end
  # end
end
