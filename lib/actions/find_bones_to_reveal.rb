module Actions
  module FindBonesToReveal
    extend self

    def run
      Game::Pyramid.not_revealed_bones.select { |bone| can_be_revealed?(bone) }
    end

    private

      def can_be_revealed?(bone)
        bone_row = Game::Pyramid.row_with_bone(bone)
        bone_position = bone_row.bone_position(bone)

        higher_row_unblocked?(bone_row, bone_position) || lower_row_unblocked?(bone_row, bone_position)
      end

      def higher_row_unblocked?(bone_row, bone_position)
        higher_row = Game::Pyramid.rows[bone_row.number - 1]

        higher_row.bones_at(bone_position, bone_position - 1).all? { |bone| bone.nil? || bone.deleted? }
      end

      def lower_row_unblocked?(bone_row, bone_position)
        lower_row = Game::Pyramid.rows[bone_row.number + 1]

        lower_row.bones_at(bone_position, bone_position + 1).all?(&:deleted?)
      end
  end
end
