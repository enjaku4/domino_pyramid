module Game
  class Pyramid
    attr_reader :rows

    def initialize
      @rows = []
    end

    def <<(row)
      @rows << row
    end
  end
end
