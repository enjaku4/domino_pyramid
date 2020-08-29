module Game
  extend self

  def start
    Pyramid.clear!
    PyramidBuilder.run

    refresh
  end

  def refresh
    Store::ClickableAreas.clear!
    Window.clear
    Graphics::PyramidDrawer.run

    Actions::CheckIfGameFinished.run
  end

  def finish(status)
    Graphics::StatusDrawer.run(status)
  end
end
