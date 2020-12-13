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
    it "calculates the correct answer for the sample input" do
      input_1 = <<~INPUT
        939
        7,13,x,x,59,x,31,19
      INPUT
      expect(Day13.part_2(input_1, 0)).to eq 1068781

      input_2 = <<~INPUT
        939
        17,x,13,19
      INPUT
      expect(Day13.part_2(input_2, 0)).to eq 3417

      input_3 = <<~INPUT
        939
        67,7,59,61
      INPUT
      expect(Day13.part_2(input_3, 0)).to eq 754018

      input_4 = <<~INPUT
        939
        67,x,7,59,61
      INPUT
      expect(Day13.part_2(input_4, 0)).to eq 779210

      input_5 = <<~INPUT
        939
        67,7,x,59,61
      INPUT
      expect(Day13.part_2(input_5, 0)).to eq 1261476

      input_6 = <<~INPUT
        939
        1789,37,47,1889
      INPUT
      expect(Day13.part_2(input_6, 0)).to eq 1202161486
    end

    it "calculates the correct answer for the input file" do
      expect(Day13.part_2).to eq 13340
    end
  end
end
