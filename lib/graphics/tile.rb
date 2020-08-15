require_relative 'hole'

module Graphics
  class Tile
    def initialize(value, x:, y:)
      @value = value
      @x = x
      @y = y
    end

    def draw
      case @value
      when 1
        draw_hole(:middle, :middle)
      when 2
        draw_hole(:left, :top)
        draw_hole(:right, :bottom)
      when 3
        draw_hole(:left, :top)
        draw_hole(:middle, :middle)
        draw_hole(:right, :bottom)
      when 4
        draw_hole(:left, :top)
        draw_hole(:left, :bottom)
        draw_hole(:right, :top)
        draw_hole(:right, :bottom)
      when 5
        draw_hole(:left, :top)
        draw_hole(:left, :bottom)
        draw_hole(:middle, :middle)
        draw_hole(:right, :top)
        draw_hole(:right, :bottom)
      when 6
        draw_hole(:left, :top)
        draw_hole(:left, :middle)
        draw_hole(:left, :bottom)
        draw_hole(:right, :top)
        draw_hole(:right, :middle)
        draw_hole(:right, :bottom)
      end
    end

    private

      def draw_hole(horizontal_position, vertical_position)
        Hole.new(horizontal_position, vertical_position, x: @x, y: @y).draw
      end
  end
end
