module Game
  extend self

  def start
    Pyramid.clear!
    PyramidBuilder.run

    refresh
  end

  def refresh
    Window.clear
    Graphics::PyramidDrawer.run

    Actions::CheckIfGameFinished.run

    Window.current.request_render
  end

  def finish(status)
    Graphics::MessageDrawer.run(status)
  end
end
