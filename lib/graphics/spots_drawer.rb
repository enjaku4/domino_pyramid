module Graphics
  class SpotsDrawer
    def initialize(value, x, y)
      @value = value
      @x = x
      @y = y
    end

    def run
      positions.map { |x, y| Circle.new(x: x, y: y, radius: Store::Settings.spot_radius, color: 'navy', z: 2) }
    end

    private

      def positions
        case @value
        when 0 then []
        when 1 then [[middle_x, middle_y]]
        when 2 then [[left, top], [right, bottom]]
        when 3 then [[left, top], [middle_x, middle_y], [right, bottom]]
        when 4 then [[left, top], [left, bottom], [right, top], [right, bottom]]
        when 5 then [[left, top], [left, bottom], [middle_x, middle_y], [right, top], [right, bottom]]
        when 6 then [[left, top], [left, middle_y], [left, bottom], [right, top], [right, middle_y], [right, bottom]]
        end
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
