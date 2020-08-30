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
        Text.new('You win', size: Store::Settings.font_size, color: 'green')
      end

      def draw_you_lose_message
        Text.new('You lose', size: Store::Settings.font_size, color: 'red')
      end
  end
end
