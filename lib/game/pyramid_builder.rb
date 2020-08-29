module Game
  module PyramidBuilder
    DOMINOES_VALUES = (0..6).each_with_object([]) do |first_value, dominoes_values|
      (first_value..6).map { |second_value| dominoes_values << [first_value, second_value] }
    end

    def self.run
      shuffled_dominoes_values = DOMINOES_VALUES.shuffle

      (0..6).each_with_object(Pyramid) do |row_number, pyramid|
        row = Row.new(row_number)

        (row_number + 1).times do
          bone = Bone.new(*shuffled_dominoes_values.pop)
          bone.reveal! if [0, 6].include?(row.number)

          row << bone
        end

        pyramid << row
      end
    end
  end
end
