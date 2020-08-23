module Graphics
  class SpotsDrawer
    def initialize(value, x, y)
      @value = value
      @x = x
      @y = y
    end

    def run
      case @value
      when 1
        draw_spot(middle_x, middle_y)
      when 2
        draw_spot(left, top)
        draw_spot(right, bottom)
      when 3
        draw_spot(left, top)
        draw_spot(middle_x, middle_y)
        draw_spot(right, bottom)
      when 4
        draw_spot(left, top)
        draw_spot(left, bottom)
        draw_spot(right, top)
        draw_spot(right, bottom)
      when 5
        draw_spot(left, top)
        draw_spot(left, bottom)
        draw_spot(middle_x, middle_y)
        draw_spot(right, top)
        draw_spot(right, bottom)
      when 6
        draw_spot(left, top)
        draw_spot(left, middle_y)
        draw_spot(left, bottom)
        draw_spot(right, top)
        draw_spot(right, middle_y)
        draw_spot(right, bottom)
      end
    end

    private

      def draw_spot(x, y)
        Circle.new(x: x, y: y, radius: Store::Settings.spot_radius, color: 'navy', z: 2)
      end

      def left
        @x + Store::Settings.bone_width / 4
      end

      def right
        @x + Store::Settings.bone_width / 4 * 3
      end

      def middle_x
        @x + Store::Settings.bone_width / 2
      end

      def top
        @y + Store::Settings.bone_height / 8
      end

      def bottom
        @y + Store::Settings.bone_height / 8 * 3
      end

      def middle_y
        @y + Store::Settings.bone_height / 4
      end
  end
end
