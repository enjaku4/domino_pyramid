module Actions
  module ProcessPlayerTurn
    extend self

    def run(event)
      clickable_area = Store::ClickableAreas.find_clicked(event.x, event.y)

      return unless clickable_area

      clickable_area.bone.toggle_selection!

      if selected_bones.count == 2
        delete_and_reveal_bones_if_possible
        selected_bones.each(&:toggle_selection!)
      end

      Game.refresh
    end

    private

      def delete_and_reveal_bones_if_possible
        if selected_bones.sum(&:rank) == 12
          selected_bones.each(&:delete!)
          bones_to_reveal.each(&:reveal!)
        end
      end

      def selected_bones
        Game::Pyramid.selected_bones
      end

      def bones_to_reveal
        FindBonesToReveal.run
      end
  end
end
