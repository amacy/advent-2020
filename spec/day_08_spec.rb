require_relative "../lib/day_08"
require "pry"

RSpec.describe Day08 do
  context "part 1" do
    it "calculates the correct answer for the sample input" do
      input = <<~INPUT
        nop +0
        acc +1
        jmp +4
        acc +3
        jmp -3
        acc -99
        acc +1
        jmp -4
        acc +6
      INPUT

      expect(Day08.part_1(input)).to eq 5
    end

    it "calculates the correct answer for the input file" do
      expect(Day08.part_1).to eq 1766
    end
  end

  context "part 2" do
    it "calculates the correct answer for the sample input" do
      input = <<~INPUT
        nop +0
        acc +1
        jmp +4
        acc +3
        jmp -3
        acc -99
        acc +1
        jmp -4
        acc +6
      INPUT

      expect(Day08.part_2(input)).to eq 8
    end

    it "calculates the correct answer for the input file" do
      expect(Day08.part_2).to eq 1639
    end
  end
end
