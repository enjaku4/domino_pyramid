module Graphics
  class ClickableArea < Button
    attr_reader :bone

    def initialize(bone, x, y)
      @bone = bone

      super(
        x: x, y: y, z: 1,
        width: Store::Settings.bone_width,
        height: Store::Settings.bone_height,
        color: bone.selected? ? 'yellow' : 'aqua',
        stroke_width: Store::Settings.border_width,
        stroke_color: 'navy',
        hover_color: :auto
      )

      on(click: :left) { Actions::ProcessPlayerTurn.run(self) }
      on(:hover) { Window.current.request_render }
      on(:hover_out) { Window.current.request_render }
    end
  end
end
