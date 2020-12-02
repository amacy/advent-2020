require_relative "../lib/day_02"
require "pry"

RSpec.describe Day02 do
  context "part 1" do
    it "calculates the correct answer for the sample input" do
      input = <<~INPUT
        1-3 a: abcde
        1-3 b: cdefg
        2-9 c: ccccccccc
      INPUT

      expect(Day02.part_1(input)).to eq 2
    end

    it "calculates the correct answer for the input file" do
      expect(Day02.part_1).to eq 515
    end
  end

  context "part 2" do
    it "calculates the correct answer for the sample input" do
      input = <<~INPUT
        1-3 a: abcde
        1-3 b: cdefg
        2-9 c: ccccccccc
      INPUT

      expect(Day02.part_2(input)).to eq 1
    end

    it "calculates the correct answer for the input file" do
      expect(Day02.part_2).to eq 711
    end
  end
end
