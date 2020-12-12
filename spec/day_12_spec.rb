require_relative "../lib/day_12"
require "pry"

RSpec.describe Day12 do
  context "part 1" do
    it "calculates the correct answer for the sample input" do
      input = <<~INPUT
        F10
        N3
        F7
        R90
        F11
      INPUT

      expect(Day12.part_1(input)).to eq 25
    end

    it "calculates the correct answer for the input file" do
      expect(Day12.part_1).to eq 1601
    end
  end

  context "part 2" do
    it "calculates the correct answer for the sample input" do
      input = <<~INPUT
        F10
        N3
        F7
        R90
        F11
      INPUT

      expect(Day12.part_2(input)).to eq 286
    end

    it "calculates the correct answer for the input file" do
      expect(Day12.part_2).to eq 13340
    end
  end
end
