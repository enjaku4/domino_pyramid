require 'byebug'
require_relative '../game/pyramid_builder'

module Graphics
  module Pyramid
    extend self

    def draw
      y = initial_y

      Game::PyramidBuilder.run.rows.each do |row|
        x = initial_x(row)

        row.bones.each do |bone|
          Rectangle.new(x: x, y: y, width: bone_width, height: bone_height, color: 'teal', z: 1)
          Text.new(bone.first_value, x: value_x(x), y: first_value_y(y), size: text_size, color: 'red', z: 2)
          Text.new(bone.second_value, x: value_x(x), y: second_value_y(y), size: text_size, color: 'red', z: 2)
          x += bone_width
        end

        y += bone_height
      end
    end

    private

      def bone_height
        Window.height / 7
      end

      def bone_width
        Window.width / 7
      end

      def initial_y
        (Window.height - bone_height * 7) / 2
      end

      def initial_x(row)
        Window.width / 2 - bone_width / 2 * row.number
      end

      def text_size
        bone_height / 5
      end

      def first_value_y(y)
        y + bone_height / 4 - text_size / 2
      end

      def second_value_y(y)
        y + bone_height / 4 * 3 - text_size / 2
      end

      def value_x(x)
        x + bone_width / 2 - text_size / 4
      end
  end
end
