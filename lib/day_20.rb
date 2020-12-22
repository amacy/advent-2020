require "set"

class Day20
  class Tile
    EMPTY = :empty
    attr_reader :empty_sides, :side_1, :side_2, :side_3, :side_4
    attr_accessor :tile_array

    def initialize(id, tile_array)
      @id = id
      @tile_array = tile_array
      @side_1_neighbor = nil
      @side_2_neighbor = nil
      @side_3_neighbor = nil
      @side_4_neighbor = nil
      @side_1 = nil
      @side_2 = nil
      @side_3 = nil
      @side_4 = nil
      @empty_sides = []
    end

    def top_edge
      @tile_array[0]
    end

    def bottom_edge
      @tile_array[-1]
    end

    def left_edge
      @tile_array.map { |row| row[0] }.join
    end

    def right_edge
      @tile_array.map { |row| row[-1] }.join
    end

    def top_neighbor
      if @side_1.include?(top_edge)
        @side_1_neighbor
      elsif @side_2.include?(top_edge)
        @side_2_neighbor
      elsif @side_3.include?(top_edge)
        @side_3_neighbor
      elsif @side_4.include?(top_edge)
        @side_4_neighbor
      end
    end

    def bottom_neighbor
      if @side_1.include?(bottom_edge)
        @side_1_neighbor
      elsif @side_2.include?(bottom_edge)
        @side_2_neighbor
      elsif @side_3.include?(bottom_edge)
        @side_3_neighbor
      elsif @side_4.include?(bottom_edge)
        @side_4_neighbor
      end
    end

    def right_neighbor
      if @side_1.include?(right_edge)
        @side_1_neighbor
      elsif @side_2.include?(right_edge)
        @side_2_neighbor
      elsif @side_3.include?(right_edge)
        @side_3_neighbor
      elsif @side_4.include?(right_edge)
        @side_4_neighbor
      end
    end

    def left_neighbor
      if @side_1.include?(left_edge)
        @side_1_neighbor
      elsif @side_2.include?(left_edge)
        @side_2_neighbor
      elsif @side_3.include?(left_edge)
        @side_3_neighbor
      elsif @side_4.include?(left_edge)
        @side_4_neighbor
      end
    end

    def complete?
      @side_1_neighbor &&
        @side_2_neighbor &&
        @side_3_neighbor &&
        @side_4_neighbor &&
        @side_1 &&
        @side_2 &&
        @side_3 &&
        @side_4
    end

    def add_outer_edge(edge)
      _store_edge(edge)
      _store_neighbor_id
      nil
    end

    def add_neighbor(id, edge)
      _store_edge(edge)
      _store_neighbor_id(id)
      nil
    end

    def _store_edge(edge)
      if @side_1.nil?
        @side_1 = edge
      elsif @side_2.nil?
        @side_2 = edge
      elsif @side_3.nil?
        @side_3 = edge
      elsif @side_4.nil?
        @side_4 = edge
      end
    end

    def _store_neighbor_id(id=EMPTY)
      if @side_1_neighbor.nil?
        @side_1_neighbor = id
        @empty_sides << :side_1 if id == EMPTY
      elsif @side_2_neighbor.nil?
        @side_2_neighbor = id
        @empty_sides << :side_2 if id == EMPTY
      elsif @side_3_neighbor.nil?
        @side_3_neighbor = id
        @empty_sides << :side_3 if id == EMPTY
      elsif @side_4_neighbor.nil?
        @side_4_neighbor = id
        @empty_sides << :side_4 if id == EMPTY
      end
    end
  end

  def self.part_1(input=File.new("config/day_20.txt").read)
    tile_hash = _parse_input(input)
    edges = _edges(tile_hash)
    corner_ids = _corner_ids(edges)

    corner_ids.inject(&:*)
  end

  def self.part_2(input=File.new("config/day_20.txt").read)
    tile_hash = _parse_input(input)
    edges_to_ids = _edges(tile_hash)
    outer_edge_ids = _outer_edge_ids(edges_to_ids).uniq
    corner_ids = _corner_ids(edges_to_ids)
    non_corner_edge_ids = outer_edge_ids - corner_ids
    image_length = Math.sqrt(tile_hash.length).to_i
    id_to_tiles = _tile_object_hash(tile_hash)

    id_to_edge = edges_to_ids.inject({}) do |hash, (edge_inversions, ids)|
      ids.each do |id|
        hash[id] ||= []
        hash[id] << edge_inversions
      end
      hash
    end

    _update_tiles!(corner_ids, id_to_tiles, id_to_edge, edges_to_ids)
    _update_tiles!(outer_edge_ids - corner_ids, id_to_tiles, id_to_edge, edges_to_ids)
    _update_tiles!(id_to_tiles.keys, id_to_tiles, id_to_edge, edges_to_ids)

    if !_all_tiles_complete?(id_to_tiles.values)
      raise "expected all tiles to be complete"
    end

    corner_id = corner_ids.shift
    top_left_tile = id_to_tiles[corner_id]
    empty_sides = top_left_tile.empty_sides.map do |side|
      top_left_tile.send(side)
    end.flatten

    until empty_sides.include?(top_left_tile.top_edge) && empty_sides.include?(top_left_tile.left_edge) do
      top_left_tile.tile_array = _rotate_clockwise(top_left_tile.tile_array)
    end

    image = Hash.new
    image[1] = top_left_tile

    (2..image_length**2).each do |index|
      puts index
      # corner
      # if image.legnth + 1 % image_length == 0
      #
      if image.length % image_length == 0
        tile = image[index - image_length]
        next_tile = id_to_tiles[tile.bottom_neighbor]

        if tile.bottom_edge != next_tile.top_edge
          until tile.bottom_edge == next_tile.top_edge do
            next_tile.tile_array = _rotate_clockwise(next_tile.tile_array)
          end
        end
      else
        tile = image[index - 1]
        next_tile = id_to_tiles[tile.right_neighbor]
        until tile.right_edge == next_tile.left_edge do
          next_tile.tile_array = _rotate_clockwise(next_tile.tile_array)
        end
      end

      if (1..3).include?(index) && next_tile.top_neighbor != :empty
        binding.pry; ""
      elsif [1,4,7].include?(index) && next_tile.left_neighbor != :empty
        binding.pry; ""
      elsif [3,6,9].include?(index) && next_tile.right_neighbor != :empty
        binding.pry; ""
      elsif (7..9).include?(index) && next_tile.bottom_neighbor != :empty
        binding.pry; ""
      end
      image[index] = next_tile
    end

    binding.pry
    final_image = image.values.each_slice(3) do |slice|
      slice.join
    end.join



    binding.pry; ""
    ""
  end

  def self._rotate_clockwise(tile_array)
    new_tile_array = []

    tile_array.each_with_index do |row, column_offset|
      column_index_to_write = tile_array.length - 1 - column_offset
      row.split("").each_with_index do |char, row_index_to_write|
        new_tile_array[row_index_to_write] ||= []
        new_tile_array[row_index_to_write][column_index_to_write] = char
      end
    end

    new_tile_array.map(&:join)
  end

  def self._update_tiles!(ids, id_to_tiles, id_to_edge, edges_to_ids)
    ids.each do |id|
      tile = id_to_tiles[id]
      next if tile.complete?
      edges = id_to_edge[id]
      edges.each do |edge|
        candidate_ids = edges_to_ids[edge] - ids
        case candidate_ids.length
        when 0
          tile.add_outer_edge(edge)
          false
        when 1
          neighbor_id = candidate_ids.first
          tile.add_neighbor(neighbor_id, edge)
          id_to_tiles[neighbor_id].add_neighbor(id, edge)
          true
        else
          raise "expected <= 1 id"
        end
      end
    end
  end

  def self._all_tiles_complete?(tiles)
    tiles.select(&:complete?).length == tiles.length
  end

  # if one side is rotated, then that tile's opposing side also needs to be rotated
  def self._tile_object_hash(tile_hash)
    tile_hash.inject({}) do |hash, (id, tile_array)|
      hash[id] = Tile.new(id, tile_array)
      hash
    end
  end

  def self._edges(tile_hash)
    tile_hash.inject({}) do |hash, (id, tile)|
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
  end

  def self._outer_edge_ids(edges)
    edges.values.select do |ids|
      ids.length == 1
    end.flatten
  end

  def self._corner_ids(edges)
    outer_edge_ids = _outer_edge_ids(edges)
    outer_edge_ids.select { |id| outer_edge_ids.count(id) == 2 }.uniq
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
