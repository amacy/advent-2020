require_relative "../lib/day_14"
require "pry"

RSpec.describe Day14 do
  context "part 1" do
    it "calculates the correct answer for the sample input" do
      input = <<~INPUT
        mask = XXXXXXXXXXXXXXXXXXXXXXXXXXXXX1XXXX0X
        mem[8] = 11
        mem[7] = 101
        mem[8] = 0
      INPUT

      expect(Day14.part_1(input)).to eq 165
    end

    it "calculates the correct answer for the input file" do
      expect(Day14.part_1).to eq 2346881602152
    end
  end

  context "part 2" do
    it "calculates the correct answer for the sample input" do
      input = <<~INPUT
        mask = 000000000000000000000000000000X1001X
        mem[42] = 100
        mask = 00000000000000000000000000000000X0XX
        mem[26] = 1
      INPUT

      expect(Day14.part_2(input)).to eq 208
    end

    it "calculates the correct answer for the input file" do
      expect(Day14.part_2).to eq 3885232834169
    end
  end
end
