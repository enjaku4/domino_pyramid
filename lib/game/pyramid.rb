module Game
  module Pyramid
    extend self

    def rows
      @@rows ||= []
    end

    def <<(row)
      rows << row
    end

    def clear!
      rows.clear
    end

    def selected_bones
      bones.select { |bone| bone.selected? }
    end

    private

      def bones
        rows.flat_map { |row| row.bones }
      end
  end
end
