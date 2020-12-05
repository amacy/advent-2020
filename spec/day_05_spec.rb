require_relative "../lib/day_05"
require "pry"

RSpec.describe Day05 do
  context "part 1" do
    it "calculates the correct answer for the sample input" do
      input = <<~INPUT
        FBFBBFFRLR
        BFFFBBFRRR
        BFFFBBFRRR
        BBFFBBFRLL
      INPUT

      expect(Day05.part_1(input)).to eq 820
    end

    it "calculates the correct answer for the input file" do
      expect(Day05.part_1).to eq 913
    end
  end

  context "part 2" do
    it "calculates the correct answer for the input file" do
      expect(Day05.part_2).to eq 717
    end
  end
end
