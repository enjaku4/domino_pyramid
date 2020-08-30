require 'ruby2d'
require 'require_all'

require_rel 'lib'

Store::Settings.set(window_width: 350.0, window_height: 700.0)

Window.set(width: Store::Settings.window_width, height: Store::Settings.window_height, title: 'Dominoes')

Window.on(:mouse_down) do |event|
  Actions::ProcessPlayerTurn.run(event) if event.button == :left
end

Window.on(:key_down) do |event|
  case event.key
  when 'return'
    Game.start
  when 'escape'
    Window.close
  end
end

Game.start

Window.show
