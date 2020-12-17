require_relative "../lib/day_17"
require "pry"

RSpec.describe Day17 do
  context "part 1" do
    it "calculates the correct answer for the sample input" do
      input = <<~INPUT
        .#.
        ..#
        ###
      INPUT
      expect(Day17.part_1(input)).to eq 436
    end

    it "calculates the correct answer for the input file" do
      expect(Day17.part_1).to eq 662
    end
  end

  context "part 2" do
    # it "calculates the correct answer for the sample input" do
    #   expect(Day17.part_2("0,3,6")).to eq 175594
    # end
    #
    # it "calculates the correct answer for the input file" do
    #   expect(Day17.part_2).to eq 37312
    # end
  end
end
