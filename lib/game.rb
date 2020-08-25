module Game
  extend self

  def start
    PyramidBuilder.run
    Graphics::PyramidDrawer.run
  end

  def restart
    Pyramid.clear!
    PyramidBuilder.run

    refresh
  end

  def refresh
    Store::ClickableAreas.clear!
    Window.clear
    Graphics::PyramidDrawer.run
  end
end
