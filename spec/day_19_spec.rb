require_relative "../lib/day_19"
require "pry"

RSpec.describe Day19 do
  context "part 1" do
    it "calculates the correct answer for the sample input" do
      input = <<~INPUT
        0: 4 1 5
        1: 2 3 | 3 2
        2: 4 4 | 5 5
        3: 4 5 | 5 4
        4: "a"
        5: "b"

        ababbb
        bababa
        abbbab
        aaabbb
        aaaabbb
      INPUT
      expect(Day19.part_1(input)).to eq 2
    end

    it "calculates the correct answer for the input file" do
      expect(Day19.part_1).to eq 29759
    end
  end

  # context "part 2" do
  #   it "calculates the correct answer for the sample input" do
  #     expect(Day19.part_2("0,3,6")).to eq 175594
  #   end
  #
  #   it "calculates the correct answer for the input file" do
  #     expect(Day19.part_2).to eq 37312
  #   end
  # end
end
