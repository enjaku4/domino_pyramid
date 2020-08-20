module Graphics
  class Bone
    def initialize(bone, x:, y:)
      @bone = bone
      @x = x
      @y = y
    end

    def draw
      draw_background
      draw_borders

      if @bone.revealed?
        draw_tiles
        draw_separator
      end
    end

    private

      def draw_background
        color = @bone.revealed? ? 'aqua' : 'gray'
        Rectangle.new(x: @x, y: @y, width: Settings.bone_width, height: Settings.bone_height, color: color, z: 1)
      end

      def draw_tiles
        Tile.new(@bone.first_value, x: @x, y: @y).draw
        Tile.new(@bone.second_value, x: @x, y: middle_y).draw
      end

      def draw_separator
        Line.new(x1: @x, y1: middle_y, x2: right_edge_x, y2: middle_y, width: Settings.separator_size, color: 'navy', z: 2)
      end

      def draw_borders
        Line.new(x1: @x, y1: @y, x2: right_edge_x, y2: @y, width: 1, color: 'navy', z: 2)
        Line.new(x1: @x, y1: bottom_edge_y, x2: right_edge_x, y2: bottom_edge_y, width: 1, color: 'navy', z: 2)
        Line.new(x1: @x, y1: @y, x2: @x, y2: bottom_edge_y, width: 1, color: 'navy', z: 2)
        Line.new(x1: right_edge_x, y1: @y, x2: right_edge_x, y2: bottom_edge_y, width: 1, color: 'navy', z: 2)
      end

      def middle_y
        @y + Settings.bone_height / 2
      end

      def right_edge_x
        @x + Settings.bone_width
      end

      def bottom_edge_y
        @y + Settings.bone_height
      end
  end
end
