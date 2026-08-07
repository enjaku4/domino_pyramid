module Game
  extend self

  def start
    Pyramid.clear!
    PyramidBuilder.run
    Graphics::PyramidView.build

    refresh
  end

  def refresh
    Graphics::PyramidView.refresh

    Actions::CheckIfGameFinished.run

    Window.current.request_render
  end

  def finish(status)
    Graphics::MessageDrawer.run(status)
  end
end
