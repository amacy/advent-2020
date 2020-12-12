require_relative "../lib/day_10"
require "pry"

RSpec.describe Day10 do
  context "part 1" do
    it "calculates the correct answer for the sample input" do
      input = <<~INPUT
        16
        10
        15
        5
        1
        11
        7
        19
        6
        12
        4
      INPUT

      expect(Day10.part_1(input)).to eq 35
    end

    it "calculates the correct answer for the input file" do
      expect(Day10.part_1).to eq 2368
    end
  end

  context "part 2" do
    it "calculates the correct answer for the sample input" do
      input_1 = <<~INPUT
        16
        10
        15
        5
        1
        11
        7
        19
        6
        12
        4
      INPUT

      expect(Day10.part_2(input_1)).to eq 8

      input_2 = <<~INPUT
        28
        33
        18
        42
        31
        14
        46
        20
        48
        47
        24
        23
        49
        45
        19
        38
        39
        11
        1
        32
        25
        35
        8
        17
        7
        9
        4
        2
        34
        10
        3
      INPUT

      expect(Day10.part_2(input_2)).to eq 19208
    end

    it "calculates the correct answer for the input file" do
      expect(Day10.part_2).to eq 20532569
    end
  end
end
