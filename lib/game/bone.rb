module Game
  class Bone
    attr_reader :first_value, :second_value, :revealed, :selected, :deleted
    alias :revealed? :revealed
    alias :selected? :selected
    alias :deleted? :deleted

    def initialize(first_value, second_value)
      @first_value = first_value
      @second_value = second_value
      @revealed = false
      @selected = false
      @deleted = false
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

    def delete!
      @deleted = true
    end
  end
end
