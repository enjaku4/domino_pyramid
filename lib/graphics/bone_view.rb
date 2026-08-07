module Graphics
  class BoneView
    def initialize(bone, x, y)
      @bone = bone
      @backside = build_backside(x, y)
      @frontside = build_frontside(x, y)
      @clickable_area = ClickableArea.new(bone, x, y)

      refresh
    end

    def refresh
      @backside.visible = !@bone.revealed? && !@bone.deleted?
      @frontside.each { |object| object.visible = revealed? }

      if revealed?
        @clickable_area.repaint
        @clickable_area.add
      else
        @clickable_area.remove
      end
    end

    private

      def revealed?
        @bone.revealed? && !@bone.deleted?
      end

      def build_backside(x, y)
        Rectangle.new(
          x: x, y: y, z: 1,
          width: Store::Settings.bone_width,
          height: Store::Settings.bone_height,
          color: 'gray',
          stroke_width: Store::Settings.border_width,
          stroke_color: 'navy'
        )
      end

      def build_frontside(x, y)
        divider_y = y + Store::Settings.bone_height / 2

        [
          *SpotsDrawer.new(@bone.first_value, x, y).run,
          *SpotsDrawer.new(@bone.second_value, x, divider_y).run,
          Line.new(
            x1: x, y1: divider_y, x2: x + Store::Settings.bone_width, y2: divider_y,
            stroke_width: Store::Settings.divider_size, color: 'navy', z: 2
          )
        ]
      end
  end
end
