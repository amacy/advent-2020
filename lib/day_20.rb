require "set"

class Day20
  def self.part_1(input=File.new("config/day_20.txt").read)
    tile_hash = _parse_input(input)

    result = tile_hash.inject({}) do |hash, (id, tile)|
      top_edge = tile[0]
      bottom_edge = tile[-1]
      left_edge = ""
      right_edge = ""
      tile.each do |row|
        left_edge << row[0]
        right_edge << row[-1]
      end

      [top_edge, bottom_edge, left_edge, right_edge].each do |edge|
        key = [edge, edge.reverse].sort
        hash[key] ||= []
        hash[key] << id
      end
      hash
    end

    edges = result.values.select do |ids|
      ids.length == 1
    end.flatten

    edges.select { |id| edges.count(id) == 2 }.uniq.inject(&:*)
  end

  def self.part_2(input=File.new("config/day_20.txt").read)
    notes = _parse_input(input)
  end

  def self._parse_input(input)
    input.split("\n\n").inject({}) do |hash, section|
      tile = section.split("\n")
      header = tile[0]
      id = header.match(/^Tile (\d{4}):$/)[1].to_i
      tile = tile[1..-1]

      hash[id] = tile
      hash
    end
  end
end
