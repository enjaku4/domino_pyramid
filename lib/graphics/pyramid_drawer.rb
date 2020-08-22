module Graphics
  module PyramidDrawer
    extend self

    def run
      Game::Pyramid.rows.each do |row|
        y = initial_y(row)
        x = initial_x(row)

        row.bones.each do |bone|
          bone.reveal if [1,7].include?(row.number)
          BoneDrawer.new(bone, x, y).draw

          x += Settings.bone_width
        end
      end
    end

    private

      def initial_x(row)
        Settings.window_width / 2 - Settings.bone_width / 2 * row.number
      end

      def initial_y(row)
        (row.number - 1) * Settings.bone_height
      end
  end
end
