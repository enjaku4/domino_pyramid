module Graphics
  module PyramidDrawer
    extend self

    def run
      Game::Pyramid.rows.each do |row|
        y = initial_y(row)
        x = initial_x(row)

        row.bones.each do |bone|
          BoneDrawer.new(bone, x, y).run
          x += Store::Settings.bone_width
        end
      end
    end

    private

      def initial_x(row)
        Store::Settings.window_width / 2 - Store::Settings.bone_width / 2 * row.number
      end

      def initial_y(row)
        (row.number - 1) * Store::Settings.bone_height
      end
  end
end
