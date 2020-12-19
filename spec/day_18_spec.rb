require_relative "../lib/day_18"
require "pry"

RSpec.describe Day18 do
  context "part 1" do
    it "calculates the correct answer for the sample input" do
      expect(Day18.part_1("1 + 2 * 3 + 4 * 5 + 6")).to eq 71
      expect(Day18.part_1("2 * 3 + (4 * 5)")).to eq 26
      expect(Day18.part_1("5 + (8 * 3 + 9 + 3 * 4 * 3)")).to eq 437
      expect(Day18.part_1("1 + (2 * 3) + (4 * (5 + 6))")).to eq 51
      expect(Day18.part_1("5 * 9 * (7 * 3 * 3 + 9 * 3 + (8 + 6 * 4))")).to eq 12240
      expect(Day18.part_1("((2 + 4 * 9) * (6 + 9 * 8 + 6) + 6) + 2 + 4 * 2")).to eq 13632
    end

    it "calculates the correct answer for the input file" do
      expect(Day18.part_1).to eq 2346881602152
    end
  end

  # context "part 2" do
  #   it "calculates the correct answer for the sample input" do
  #     input = <<~INPUT
  #       mask = 000000000000000000000000000000X1001X
  #       mem[42] = 100
  #       mask = 00000000000000000000000000000000X0XX
  #       mem[26] = 1
  #     INPUT
  #
  #     expect(Day18.part_2(input)).to eq 208
  #   end
  #
  #   it "calculates the correct answer for the input file" do
  #     expect(Day18.part_2).to eq 3885232834169
  #   end
  # end
end
