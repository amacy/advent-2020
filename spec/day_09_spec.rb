require_relative "../lib/day_09"
require "pry"

RSpec.describe Day09 do
  context "part 1" do
    it "calculates the correct answer for the sample input" do
      input = <<~INPUT
        35
        20
        15
        25
        47
        40
        62
        55
        65
        95
        102
        117
        150
        182
        127
        219
        299
        277
        309
        576
      INPUT

      expect(Day09.part_1(input, 5)).to eq 127
    end

    it "calculates the correct answer for the input file" do
      expect(Day09.part_1).to eq 144381670
    end
  end

  context "part 2" do
    it "calculates the correct answer for the sample input" do
      input = <<~INPUT
        35
        20
        15
        25
        47
        40
        62
        55
        65
        95
        102
        117
        150
        182
        127
        219
        299
        277
        309
        576
      INPUT

      expect(Day09.part_2(input, 5)).to eq 62
    end

    it "calculates the correct answer for the input file" do
      expect(Day09.part_2).to eq 20532569
    end
  end
end
