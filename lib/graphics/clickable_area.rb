module Graphics
  class ClickableArea < Rectangle
    attr_reader :bone

    def initialize(bone, x, y)
      @bone = bone

      super(
        x: x, y: y, z: 1,
        width: Store::Settings.bone_width,
        height: Store::Settings.bone_height,
        color: bone.selected? ? 'yellow' : 'aqua',
        stroke_width: Store::Settings.border_width,
        stroke_color: 'navy'
      )

      on(click: :left) { Actions::ProcessPlayerTurn.run(self) }
    end
  end
end
