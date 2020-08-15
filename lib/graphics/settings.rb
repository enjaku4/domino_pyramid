module Graphics
  module Settings
    extend self

    def set(window_width:, window_height:)
      data[:window_width] = window_width
      data[:window_height] = window_height

      build_graphics_settings
    end

    def method_missing(method_name)
      data.fetch(method_name)
    end

    private

      def data
        @@data ||= {}
      end

      def build_graphics_settings
        set_bone_width
        set_bone_height
        set_separator_size
        set_hole_radius
      end

      def set_bone_width
        data[:bone_width] = window_width / 7
      end

      def set_bone_height
        data[:bone_height] = window_height / 7
      end

      def set_separator_size
        data[:separator_size] = bone_height / 34
      end

      def set_hole_radius
        data[:hole_radius] = bone_height / 25
      end
  end
end
