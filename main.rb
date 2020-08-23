require 'ruby2d'

Dir["#{File.dirname(__FILE__)}/lib/**/*.rb"].each { |f| load(f) }

Store::Settings.set(window_width: 350.0, window_height: 700.0)

Window.set(width: Store::Settings.window_width, height: Store::Settings.window_height, title: 'Dominoes', diagnostics: true)

Game::PyramidBuilder.run

Window.update do
  Window.clear
  Graphics::PyramidDrawer.run
end

Window.on(:mouse_down) do |event|
  Actions::ProcessBoneSelection.run(event) if event.button == :left
end

Window.on(:key_down) do |event|
  case event.key
  when 'return'
    Game::Pyramid.clear!
    Store::ClickableAreas.clear!
    Game::PyramidBuilder.run
  when 'escape'
    Window.close
  end
end

Window.show
