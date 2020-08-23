module Graphics
  class BoneDrawer
    def initialize(bone, x, y)
      @bone = bone
      @x = x
      @y = y
    end

    def run
      if @bone.revealed?
        draw_frontside
        create_clickable_area
      else
        draw_backside
      end

      draw_borders
    end

    private

      def draw_borders
        Line.new(x1: @x, y1: @y, x2: right, y2: @y, width: Store::Settings.horizontal_border_width, color: 'navy', z: 2)
        Line.new(x1: @x, y1: bottom, x2: right, y2: bottom, width: Store::Settings.horizontal_border_width, color: 'navy', z: 2)
        Line.new(x1: @x, y1: @y, x2: @x, y2: bottom, width: Store::Settings.vertical_border_width, color: 'navy', z: 2)
        Line.new(x1: right, y1: @y, x2: right, y2: bottom, width: Store::Settings.vertical_border_width, color: 'navy', z: 2)
      end

      def draw_backside
        Rectangle.new(x: @x, y: @y, width: Store::Settings.bone_width, height: Store::Settings.bone_height, color: 'gray', z: 1)
      end

      def draw_frontside
        SpotsDrawer.new(@bone.first_value, @x, @y).run
        SpotsDrawer.new(@bone.second_value, @x, middle_y).run

        Line.new(x1: @x, y1: middle_y, x2: right, y2: middle_y, width: Store::Settings.divider_size, color: 'navy', z: 2)
      end

      def create_clickable_area
        ClickableArea.new(@bone, @x, @y).store
      end

      def right
        @x + Store::Settings.bone_width
      end

      def bottom
        @y + Store::Settings.bone_height
      end

      def middle_y
        @y + Store::Settings.bone_height / 2
      end
  end
end
