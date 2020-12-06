require_relative "../lib/day_06"
require "pry"

RSpec.describe Day06 do
  context "part 1" do
    it "calculates the correct answer for the sample input" do
      input = <<~INPUT
        abc

        a
        b
        c

        ab
        ac

        a
        a
        a
        a

        b
      INPUT

      expect(Day06.part_1(input)).to eq 11
    end

    it "calculates the correct answer for the input file" do
      expect(Day06.part_1).to eq 6735
    end
  end

  context "part 2" do
    it "calculates the correct answer for the sample input" do
      input = <<~INPUT
        abc

        a
        b
        c

        ab
        ac

        a
        a
        a
        a

        b
      INPUT

      expect(Day06.part_2(input)).to eq 6
    end

    it "calculates the correct answer for the input file" do
      expect(Day06.part_2).to eq 3221
    end
  end
end
