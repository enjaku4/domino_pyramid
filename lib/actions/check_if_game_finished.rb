module Actions
  module CheckIfGameFinished
    extend self

    def run
      if game_won?
        Game.finish(:won)
      elsif game_lost?
        Game.finish(:lost)
      end
    end

    private

      def game_lost?
        Game::Pyramid.revealed_bones.each.with_index(1) do |bone_1, index|
          Game::Pyramid.revealed_bones.drop(index).each do |bone_2|
            return false if bone_1.rank + bone_2.rank == 12
          end
        end

        true
      end

      def game_won?
        Game::Pyramid.bones.all?(&:deleted?)
      end
  end
end
