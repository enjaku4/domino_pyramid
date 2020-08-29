module Game
  class Row
    attr_reader :bones, :number

    def initialize(number)
      @number = number
      @bones = []
    end

    def <<(bone)
      @bones << bone
    end

    def has_bone?(bone)
      @bones.include?(bone)
    end

    def bone_position(bone)
      @bones.index(bone)
    end

    def bones_at(*positions)
      positions.map { |position| position < 0 ? nil : @bones[position] }
    end
  end
end
