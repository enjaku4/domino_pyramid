module Graphics
  class BoneDrawer
    def initialize(bone, x, y)
      @bone = bone
      @x = x
      @y = y
    end

    def run
      if @bone.revealed?
        draw_tiles
        draw_separator
        create_clickable_area
      else
        draw_dark_side
      end

      draw_borders
    end

    private

      def create_clickable_area
        ClickableArea.new(@bone, @x, @y).store
      end

      def draw_dark_side
        Rectangle.new(x: @x, y: @y, width: Store::Settings.bone_width, height: Store::Settings.bone_height, color: 'gray', z: 1)
      end

      def draw_tiles
        TileDrawer.new(@bone.first_value, left, top).run
        TileDrawer.new(@bone.second_value, left, middle_y).run
      end

      def draw_separator
        Line.new(x1: left, y1: middle_y, x2: right, y2: middle_y, width: Store::Settings.separator_size, color: 'navy', z: 2)
      end

      def draw_borders
        Line.new(x1: left, y1: top, x2: right, y2: top, width: Store::Settings.horizontal_border_width, color: 'navy', z: 2)
        Line.new(x1: left, y1: bottom, x2: right, y2: bottom, width: Store::Settings.horizontal_border_width, color: 'navy', z: 2)
        Line.new(x1: left, y1: top, x2: left, y2: bottom, width: Store::Settings.vertical_border_width, color: 'navy', z: 2)
        Line.new(x1: right, y1: top, x2: right, y2: bottom, width: Store::Settings.vertical_border_width, color: 'navy', z: 2)
      end

      def left
        @x
      end

      def right
        @x + Store::Settings.bone_width
      end

      def top
        @y
      end

      def bottom
        @y + Store::Settings.bone_height
      end

      def middle_y
        @y + Store::Settings.bone_height / 2
      end
  end
end
