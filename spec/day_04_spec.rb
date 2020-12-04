require_relative "../lib/day_04"
require "pry"

RSpec.describe Day04 do
  context "part 1" do
    it "calculates the correct answer for the sample input" do
      input = <<~INPUT
        ecl:gry pid:860033327 eyr:2020 hcl:#fffffd
        byr:1937 iyr:2017 cid:147 hgt:183cm

        iyr:2013 ecl:amb cid:350 eyr:2023 pid:028048884
        hcl:#cfa07d byr:1929

        hcl:#ae17e1 iyr:2013
        eyr:2024
        ecl:brn pid:760753108 byr:1931
        hgt:179cm

        hcl:#cfa07d eyr:2025 pid:166559648
        iyr:2011 ecl:brn hgt:59in
      INPUT

      expect(Day04.part_1(input)).to eq 2
    end

    it "calculates the correct answer for the input file" do
      expect(Day04.part_1).to eq 170
    end
  end

  # context "part 2" do
  #   it "calculates the correct answer for the sample input" do
  #     input = <<~INPUT
  #       ecl:gry pid:860033327 eyr:2020 hcl:#fffffd
  #       byr:1937 iyr:2017 cid:147 hgt:183cm
  #
  #       iyr:2013 ecl:amb cid:350 eyr:2023 pid:028048884
  #       hcl:#cfa07d byr:1929
  #
  #       hcl:#ae17e1 iyr:2013
  #       eyr:2024
  #       ecl:brn pid:760753108 byr:1931
  #       hgt:179cm
  #
  #       hcl:#cfa07d eyr:2025 pid:166559648
  #       iyr:2011 ecl:brn hgt:59in
  #     INPUT
  #
  #     expect(Day04.part_2(input)).to eq 336
  #   end
  #
  #   it "calculates the correct answer for the input file" do
  #     expect(Day04.part_2).to eq 3316272960
  #   end
  # end
end
