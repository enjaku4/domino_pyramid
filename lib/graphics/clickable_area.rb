module Graphics
  class ClickableArea < Rectangle
    attr_reader :bone

    def initialize(bone, x, y)
      @bone = bone

      super(
        x: x, y: y, z: 1,
        width: Store::Settings.bone_width,
        height: Store::Settings.bone_height,
        color: bone.selected? ? 'yellow' : 'aqua'
      )
    end

    def store
      Store::ClickableAreas << self
    end
  end
end
