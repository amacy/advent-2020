require_relative "../lib/day_21"
require "pry"

RSpec.describe Day21 do
  context "part 1" do
    it "calculates the correct answer for the sample input" do
      input = <<~INPUT
        mxmxvkd kfcds sqjhc nhms (contains dairy, fish)
        trh fvjkl sbzzf mxmxvkd (contains dairy)
        sqjhc fvjkl (contains soy)
        sqjhc mxmxvkd sbzzf (contains fish)
      INPUT
      expect(Day21.part_1(input)).to eq 5
    end

    it "calculates the correct answer for the input file" do
      expect(Day21.part_1).to eq 8425574315321
    end
  end

  # context "part 2" do
  #   it "calculates the correct answer for the sample input" do
  #     expect(Day21.part_2("0,3,6")).to eq 175594
  #   end
  #
  #   it "calculates the correct answer for the input file" do
  #     expect(Day21.part_2).to eq 37312
  #   end
  # end
end
