module Actions
  module ProcessPlayerTurn
    extend self

    def run(event)
      clickable_area = Store::ClickableAreas.find_clicked(event.x, event.y)

      return unless clickable_area

      clickable_area.bone.toggle_selection!

      process_calculation if selected_bones.count == 2

      selected_bones.each(&:toggle_selection!)

      Game.refresh
    end

    private

      def selected_bones
        Game::Pyramid.selected_bones
      end

      def process_calculation
        if selected_bones.sum(&:rank) == 12
          selected_bones.each(&:delete!)
          # TODO reveal bones if possible
          # TODO check if lost
          # TODO check if won
        end
      end
  end
end
