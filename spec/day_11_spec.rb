require_relative "../lib/day_11"
require "pry"

RSpec.describe Day11 do
  context "part 1" do
    it "calculates the correct answer for the sample input" do
      input = <<~INPUT
        L.LL.LL.LL
        LLLLLLL.LL
        L.L.L..L..
        LLLL.LL.LL
        L.LL.LL.LL
        L.LLLLL.LL
        ..L.L.....
        LLLLLLLLLL
        L.LLLLLL.L
        L.LLLLL.LL
      INPUT

      expect(Day11.part_1(input)).to eq 37
    end

    it "calculates the correct answer for the input file" do
      expect(Day11.part_1).to eq 2324
    end
  end

  # context "part 2" do
  #   it "calculates the correct answer for the sample input" do
  #     input = <<~INPUT
  #     INPUT
  #
  #     expect(Day11.part_2(input)).to eq 62
  #   end
  #
  #   it "calculates the correct answer for the input file" do
  #     expect(Day11.part_2).to eq 20532569
  #   end
  # end
end
