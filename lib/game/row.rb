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
  end
end
