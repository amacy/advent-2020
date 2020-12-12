require_relative "../lib/day_10"
require "pry"

RSpec.describe Day10 do
  context "part 1" do
    it "calculates the correct answer for the sample input" do
      input = <<~INPUT
        16
        10
        15
        5
        1
        11
        7
        19
        6
        12
        4
      INPUT

      expect(Day10.part_1(input)).to eq 35
    end

    it "calculates the correct answer for the input file" do
      expect(Day10.part_1).to eq 2368
    end
  end

  # context "part 2" do
  #   it "calculates the correct answer for the sample input" do
  #     input = <<~INPUT
  #     INPUT
  #
  #     expect(Day10.part_2(input, 5)).to eq 62
  #   end
  #
  #   it "calculates the correct answer for the input file" do
  #     expect(Day10.part_2).to eq 20532569
  #   end
  # end
end
