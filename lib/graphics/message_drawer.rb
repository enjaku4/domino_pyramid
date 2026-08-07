module Graphics
  module MessageDrawer
    extend self

    def run(game_status)
      case game_status
      when :won then draw_you_win_message
      when :lost then draw_you_lose_message
      else raise UnknownStatusError, "unknown game status \'#{game_status}\'"
      end
    end

    class UnknownStatusError < StandardError;end

    private

      def draw_you_win_message
        draw_message('You win', 'green')
      end

      def draw_you_lose_message
        draw_message('You lose', 'red')
      end

      def draw_message(text, color)
        Text.new(text, x: :center, y: :center, z: 3, style: :bold, size: Store::Settings.font_size, color: color)
      end
  end
end
