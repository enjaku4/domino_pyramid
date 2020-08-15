module Graphics
  class Hole
    def initialize(horizontal_position, vertical_position, x:, y:)
      @x = x + send("#{horizontal_position}_x")
      @y = y + send("#{vertical_position}_y")
    end

    def draw
      Circle.new(x: @x, y: @y, radius: Settings.hole_radius, color: 'navy', z: 2)
    end

    private

      def left_x
        Settings.bone_width / 4
      end

      def middle_x
        Settings.bone_width / 2
      end

      def right_x
        Settings.bone_width / 4 * 3
      end

      def top_y
        Settings.bone_height / 8
      end

      def middle_y
        Settings.bone_height / 4
      end

      def bottom_y
        Settings.bone_height / 8 * 3
      end
  end
end
