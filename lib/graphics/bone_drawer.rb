module Graphics
  class BoneDrawer
    def initialize(bone, x, y)
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
        Rectangle.new(x: left, y: top, width: Settings.bone_width, height: Settings.bone_height, color: color, z: 1)
      end

      def draw_tiles
        TileDrawer.new(@bone.first_value, left, top).draw
        TileDrawer.new(@bone.second_value, left, middle_y).draw
      end

      def draw_separator
        Line.new(x1: left, y1: middle_y, x2: right, y2: middle_y, width: Settings.separator_size, color: 'navy', z: 2)
      end

      def draw_borders
        Line.new(x1: left, y1: top, x2: right, y2: top, width: 1, color: 'navy', z: 2)
        Line.new(x1: left, y1: bottom, x2: right, y2: bottom, width: 1, color: 'navy', z: 2)
        Line.new(x1: left, y1: top, x2: left, y2: bottom, width: 1, color: 'navy', z: 2)
        Line.new(x1: right, y1: top, x2: right, y2: bottom, width: 1, color: 'navy', z: 2)
      end

      def left
        @x
      end

      def right
        @x + Settings.bone_width
      end

      def top
        @y
      end

      def bottom
        @y + Settings.bone_height
      end

      def middle_y
        @y + Settings.bone_height / 2
      end
  end
end
