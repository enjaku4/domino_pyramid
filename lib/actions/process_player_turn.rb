module Actions
  module ProcessPlayerTurn
    extend self

    def run(event)
      clickable_area = Store::ClickableAreas.find_clicked(event.x, event.y)

      return unless clickable_area

      clickable_area.bone.toggle_selection!

      if selected_bones.count == 2
        apply_rules
        selected_bones.each(&:toggle_selection!)
      end

      Game.refresh
    end

    private

      def apply_rules
        if selected_bones.sum(&:rank) == 12
          selected_bones.each(&:delete!)
          bones_to_reveal.each(&:reveal!)
          # TODO check if lost
          # TODO check if won
        end
      end

      def selected_bones
        Game::Pyramid.selected_bones
      end

      def bones_to_reveal
        Actions::FindBonesToReveal.run
      end
  end
end
