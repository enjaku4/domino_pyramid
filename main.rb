require 'ruby2d'

Dir["#{File.dirname(__FILE__)}/lib/**/*.rb"].each { |f| load(f) }

Graphics::Settings.set(window_width: 350.0, window_height: 700.0)

Window.set(
  width: Graphics::Settings.window_width,
  height: Graphics::Settings.window_height,
  title: 'Domino Pyramid',
  diagnostics: true
)

Game::PyramidBuilder.run
Graphics::PyramidDrawer.run

Window.show
