module Game
  class Bone
    attr_reader :revealed, :first_value, :second_value
    alias :revealed? :revealed

    def initialize(first_value, second_value)
      @first_value = first_value
      @second_value = second_value
      @revealed = false
    end

    def rank
      @first_value + @second_value
    end

    def reveal
      @revealed = true
    end
  end
end
