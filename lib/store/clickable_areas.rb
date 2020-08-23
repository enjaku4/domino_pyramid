module Store
  module ClickableAreas
    extend self

    def collection
      @@collection ||= []
    end

    def <<(clickable_area)
      collection << clickable_area
    end

    def find_clicked(x, y)
      collection.detect { |area| area.contains?(x, y) }
    end

    def clear!
      collection.clear
    end
  end
end
