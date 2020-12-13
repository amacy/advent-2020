require_relative "../lib/day_13"
require "pry"

RSpec.describe Day13 do
  context "part 1" do
    it "calculates the correct answer for the sample input" do
      input = <<~INPUT
        939
        7,13,x,x,59,x,31,19
      INPUT

      expect(Day13.part_1(input)).to eq 295
    end

    it "calculates the correct answer for the input file" do
      expect(Day13.part_1).to eq 104
    end
  end

  context "part 2" do
    # it "calculates the correct answer for the sample input" do
    #   input = <<~INPUT
    #     F10
    #     N3
    #     F7
    #     R90
    #     F11
    #   INPUT
    #
    #   expect(Day13.part_2(input)).to eq 286
    # end
    #
    # it "calculates the correct answer for the input file" do
    #   expect(Day13.part_2).to eq 13340
    # end
  end
end
