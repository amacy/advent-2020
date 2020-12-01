require_relative "../lib/day_01"

RSpec.describe Day01 do
  it "calculates the correct answer for the sample input" do
    input = <<~INPUT
      1721
      979
      366
      299
      675
      1456
    INPUT

    expect(Day01.part_1(input)).to eq 514579
  end

  it "calculates the correct answer for the input file" do
    expect(Day01.part_1).to eq 138379
  end
end
