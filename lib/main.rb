require 'ruby2d'
require_relative 'graphics/settings'
require_relative 'graphics/pyramid_drawer'

Graphics::Settings.set(window_width: 350.0, window_height: 700.0)

Window.set(
  width: Graphics::Settings.window_width,
  height: Graphics::Settings.window_height,
  title: 'Domino Pyramid',
  diagnostics: true
)

Graphics::PyramidDrawer.run

Window.show
