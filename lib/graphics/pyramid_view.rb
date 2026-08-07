module Graphics
  module PyramidView
    extend self

    def build
      Window.clear

      @bone_views = Game::Pyramid.rows.flat_map do |row|
        y = initial_y(row)
        x = initial_x(row)

        row.bones.map.with_index do |bone, position|
          BoneView.new(bone, x + position * Store::Settings.bone_width, y)
        end
      end
    end

    def refresh
      bone_views.each(&:refresh)
    end

    private

      def bone_views
        @bone_views ||= []
      end

      def initial_x(row)
        Store::Settings.window_width / 2 - Store::Settings.bone_width / 2 * (row.number + 1)
      end

      def initial_y(row)
        row.number * Store::Settings.bone_height
      end
  end
end
