require_relative "../lib/day_03"
require "pry"

RSpec.describe Day03 do
  context "part 1" do
    it "calculates the correct answer for the sample input" do
      input = <<~INPUT
        ..##.......
        #...#...#..
        .#....#..#.
        ..#.#...#.#
        .#...##..#.
        ..#.##.....
        .#.#.#....#
        .#........#
        #.##...#...
        #...##....#
        .#..#...#.#
      INPUT

      expect(Day03.part_1(input)).to eq 7
    end

    it "calculates the correct answer for the input file" do
      expect(Day03.part_1).to eq 203
    end
  end

  context "part 2" do
    it "calculates the correct answer for the sample input" do
      input = <<~INPUT
        ..##.......
        #...#...#..
        .#....#..#.
        ..#.#...#.#
        .#...##..#.
        ..#.##.....
        .#.#.#....#
        .#........#
        #.##...#...
        #...##....#
        .#..#...#.#
      INPUT

      expect(Day03.part_2(input)).to eq 336
    end

    it "calculates the correct answer for the input file" do
      expect(Day03.part_2).to eq 3316272960
    end
  end
end
