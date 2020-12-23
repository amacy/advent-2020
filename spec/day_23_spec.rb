require_relative "../lib/day_23"
require "pry"

RSpec.describe Day23 do
  context "part 1" do
    it "calculates the correct answer for the sample input" do
      input = "389125467"
      expect(Day23.part_1(input)).to eq 67384529
    end

    it "calculates the correct answer for the input file" do
      expect(Day23.part_1).to eq 32401
    end
  end

  # context "part 2" do
  #   it "calculates the correct answer for the sample input" do
  #     input = <<~INPUT
  #       Player 1:
  #       9
  #       2
  #       6
  #       3
  #       1
  #
  #       Player 2:
  #       5
  #       8
  #       4
  #       7
  #       10
  #     INPUT
  #     expect(Day23.part_2(input)).to eq 291
  #   end
  #
  #   it "doesn't loop infinitely" do
  #     input = <<~INPUT
  #       Player 1:
  #         43
  #         19
  #
  #       Player 2:
  #         2
  #         29
  #         14
  #     INPUT
  #     expect(Day23.part_2(input)).to_not be_nil
  #   end
  #
  #   it "calculates the correct answer for the input file" do
  #     expect(Day23.part_2).to eq 31436
  #   end
  # end
end
