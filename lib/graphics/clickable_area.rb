module Graphics
  class ClickableArea < Rectangle
    attr_reader :bone

    def initialize(bone, x, y)
      @bone = bone
      @x = x
      @y = y
      @z = 1
      @width = Store::Settings.bone_width
      @height = Store::Settings.bone_height
      self.color = @bone.selected? ? 'yellow' : 'aqua'
      update_coords(@x, @y, @width, @height)
      add
    end

    def store
      Store::ClickableAreas << self
    end
  end
end
