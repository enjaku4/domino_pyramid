module Graphics
  module MessageDrawer
    extend self

    def run(game_status)
      text, color = case game_status
                    when :won then ['You win', 'green']
                    when :lost then ['You lose', 'red']
                    else raise UnknownStatusError, "unknown game status \'#{game_status}\'"
                    end

      objects.each(&:remove)

      message = draw_message(text, color)

      @objects = [message, draw_backdrop(message), *draw_buttons]
    end

    class UnknownStatusError < StandardError;end

    private

      def objects
        @objects ||= []
      end

      def draw_message(text, color)
        Text.new(text, x: :center, y: :center, z: 4, style: :bold, size: Store::Settings.font_size, color: color)
      end

      def draw_backdrop(message)
        Rectangle.new(
          x: :center, y: :center, z: 3,
          width: message.width + Store::Settings.font_size,
          height: message.height + Store::Settings.font_size / 2,
          color: 'black',
          stroke_width: Store::Settings.border_width,
          stroke_color: 'gray'
        )
      end

      def draw_buttons
        buttons = [['New game', proc { Game.start }]]
        buttons << ['Quit', proc { Window.close }] unless Ruby2D.web?

        x = first_button_x(buttons.size)

        buttons.map do |label, action|
          draw_button(label, x, &action).tap { x += button_width + button_gap }
        end
      end

      def draw_button(label, x, &action)
        button = Button.new(
          x: x, y: buttons_y, z: 3,
          width: button_width, height: button_height,
          label: label, label_size: label_size,
          color: 'navy', hover_color: :auto,
          stroke_width: Store::Settings.border_width, stroke_color: 'gray',
          &action
        )

        button.on(:hover) { Window.current.request_render }
        button.on(:hover_out) { Window.current.request_render }

        button
      end

      def first_button_x(count)
        (Store::Settings.window_width - count * button_width - (count - 1) * button_gap) / 2
      end

      def buttons_y
        Store::Settings.window_height / 2 + Store::Settings.font_size
      end

      def button_width
        Store::Settings.window_width / 3
      end

      def button_height
        Store::Settings.font_size * 1.8
      end

      def button_gap
        Store::Settings.font_size
      end

      def label_size
        Store::Settings.font_size * 0.6
      end
  end
end
