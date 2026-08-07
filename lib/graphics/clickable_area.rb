module Graphics
  class ClickableArea < Button
    attr_reader :bone

    def initialize(bone, x, y)
      @bone = bone

      super(
        x: x, y: y, z: 1,
        width: Store::Settings.bone_width,
        height: Store::Settings.bone_height,
        color: base_color,
        stroke_width: Store::Settings.border_width,
        stroke_color: 'navy'
      )

      on(click: :left) { Actions::ProcessPlayerTurn.run(self) }
      on(:hover) { repaint(hovered: true) }
      on(:hover_out) { repaint(hovered: false) }
    end

    def repaint(hovered: @hovered)
      @hovered = hovered
      self.color = @hovered ? lighten(base_color) : base_color

      Window.current.request_render
    end

    private

      def base_color
        @bone.selected? ? 'yellow' : 'aqua'
      end

      def lighten(color)
        color = Color.new(color)

        Color.new([color.r, color.g, color.b].map { |channel| [channel + 0.15, 1.0].min } + [color.a])
      end
  end
end
