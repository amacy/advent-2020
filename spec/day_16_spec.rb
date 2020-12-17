require_relative "../lib/day_16"
require "pry"

RSpec.describe Day16 do
  context "part 1" do
    it "calculates the correct answer for the sample input" do
      input = <<~INPUT
        class: 1-3 or 5-7
        row: 6-11 or 33-44
        seat: 13-40 or 45-50

        your ticket:
        7,1,14

        nearby tickets:
        7,3,47
        40,4,50
        55,2,20
        38,6,12
      INPUT
      expect(Day16.part_1(input)).to eq 71
    end

    it "calculates the correct answer for the input file" do
      expect(Day16.part_1).to eq 29759
    end
  end

  # context "part 2" do
  #   it "calculates the correct answer for the sample input" do
  #     expect(Day16.part_2("0,3,6")).to eq 175594
  #   end
  #
  #   it "calculates the correct answer for the input file" do
  #     expect(Day16.part_2).to eq 37312
  #   end
  # end
end
