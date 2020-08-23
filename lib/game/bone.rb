module Game
  class Bone
    attr_reader :first_value, :second_value, :revealed, :selected
    alias :revealed? :revealed
    alias :selected? :selected

    def initialize(first_value, second_value)
      @first_value = first_value
      @second_value = second_value
      @revealed = false
      @selected = false
    end

    def rank
      @first_value + @second_value
    end

    def reveal!
      @revealed = true
    end

    def toggle_selection!
      @selected = !@selected
    end
  end
end
