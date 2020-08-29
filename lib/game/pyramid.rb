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

    def row_with_bone(bone)
      rows.find { |row| row.has_bone?(bone) }
    end

    def selected_bones
      bones.select { |bone| bone.selected? }
    end

    def not_revealed_bones
      bones.select { |bone| !bone.revealed? }
    end

    private

      def bones
        rows.flat_map { |row| row.bones }
      end
  end
end
