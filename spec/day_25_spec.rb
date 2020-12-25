require_relative "../lib/day_25"
require "pry"

RSpec.describe Day25 do
  context "part 1" do
    it "calculates the correct loop size" do
      expect(Day25.loop_size(5764801)).to eq 8
      expect(Day25.loop_size(17807724)).to eq 11
    end

    it "calculates the correct answer for the sample input" do
      expect(Day25.part_1("5764801\n17807724")).to eq 14897079
    end

    it "calculates the correct answer for the input file" do
      expect(Day25.part_1).to eq 19414467
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
  #     expect(Day25.part_2(input)).to eq 291
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
  #     expect(Day25.part_2(input)).to_not be_nil
  #   end
  #
  #   it "calculates the correct answer for the input file" do
  #     expect(Day25.part_2).to eq 31436
  #   end
  # end
end
