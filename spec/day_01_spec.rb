require_relative "../lib/day_01"
require "pry"

RSpec.describe Day01 do
  context "part 1" do
    it "calculates the correct answer for the sample input" do
      input = <<~INPUT
        1721
        979
        366
        299
        675
        1456
      INPUT

      expect(Day01.part_1(input)).to eq 514579
    end

    it "calculates the correct answer for the input file" do
      expect(Day01.part_1).to eq 138379
    end
  end

  context "part 2" do
    it "calculates the correct answer for the sample input" do
      input = <<~INPUT
        1721
        979
        366
        299
        675
        1456
      INPUT

      expect(Day01.part_2(input)).to eq 241861950
    end

    it "calculates the correct answer for the input file" do
      expect(Day01.part_2).to eq 85491920
    end
  end
end
