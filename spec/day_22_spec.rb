require_relative "../lib/day_22"
require "pry"

RSpec.describe Day22 do
  context "part 1" do
    it "calculates the correct answer for the sample input" do
      input = <<~INPUT
        Player 1:
        9
        2
        6
        3
        1

        Player 2:
        5
        8
        4
        7
        10
      INPUT
      expect(Day22.part_1(input)).to eq 20899048083289
    end

    it "calculates the correct answer for the input file" do
      expect(Day22.part_1).to eq 32401
    end
  end

  # context "part 2" do
  #   it "calculates the correct answer for the sample input" do
  #     expect(Day22.part_2("0,3,6")).to eq 175594
  #   end
  #
  #   it "calculates the correct answer for the input file" do
  #     expect(Day22.part_2).to eq 37312
  #   end
  # end
end
