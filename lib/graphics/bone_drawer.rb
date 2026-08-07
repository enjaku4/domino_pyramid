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
        ClickableArea.new(@bone, @x, @y)
      else
        draw_backside
      end
    end

    private

      def draw_backside
        Rectangle.new(
          x: @x, y: @y, z: 1,
          width: Store::Settings.bone_width,
          height: Store::Settings.bone_height,
          color: 'gray',
          stroke_width: Store::Settings.border_width,
          stroke_color: 'navy'
        )
      end

      def draw_frontside
        SpotsDrawer.new(@bone.first_value, @x, @y).run
        SpotsDrawer.new(@bone.second_value, @x, middle_y).run

        Line.new(x1: @x, y1: middle_y, x2: right, y2: middle_y, stroke_width: Store::Settings.divider_size, color: 'navy', z: 2)
      end

      def right
        @x + Store::Settings.bone_width
      end

      def middle_y
        @y + Store::Settings.bone_height / 2
      end
  end
end
