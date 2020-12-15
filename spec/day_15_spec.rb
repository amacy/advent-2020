require_relative "../lib/day_15"
require "pry"

RSpec.describe Day15 do
  context "part 1" do
    it "calculates the correct answer for the sample input" do
      expect(Day15.part_1("0,3,6")).to eq 436
    end

    it "calculates the correct answer for the input file" do
      expect(Day15.part_1).to eq 662
    end
  end

  context "part 2" do
    it "calculates the correct answer for the sample input" do
      expect(Day15.part_2("0,3,6")).to eq 175594
    end

    it "calculates the correct answer for the input file" do
      expect(Day15.part_2).to eq 37312
    end
  end
end
