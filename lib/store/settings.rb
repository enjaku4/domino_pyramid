module Store
  module Store::Settings
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
        set_divider_size
        set_spot_radius
        set_vertical_border_width
        set_horizontal_border_width
      end

      def set_bone_width
        data[:bone_width] = window_width / 7
      end

      def set_bone_height
        data[:bone_height] = window_height / 7
      end

      def set_divider_size
        data[:divider_size] = bone_height / 34
      end

      def set_spot_radius
        data[:spot_radius] = bone_height / 25
      end

      def set_vertical_border_width
        data[:vertical_border_width] = bone_height / 50
      end

      def set_horizontal_border_width
        data[:horizontal_border_width] = bone_width / 25
      end
  end
end
