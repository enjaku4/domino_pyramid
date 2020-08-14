require 'ruby2d'
require_relative 'graphics/pyramid'

Window.set width: 350, height: 700, title: 'Domino Pyramid', diagnostics: true

Graphics::Pyramid.draw

Window.show
