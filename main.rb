require 'ruby2d'

Dir["#{File.dirname(__FILE__)}/lib/**/*.rb"].each { |f| load(f) }

Store::Settings.set(window_width: 350.0, window_height: 700.0)

Window.set(
  width: Store::Settings.window_width,
  height: Store::Settings.window_height,
  title: 'Domino Pyramid',
  close_on_esc: true,
  render_mode: :on_demand
)

Window.on(key_down: :return) { Game.start }

Game.start

Window.show
