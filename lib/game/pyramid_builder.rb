module Game
  module PyramidBuilder
    DOMINOES_VALUES = (0..6).each_with_object([]) do |first_value, dominoes|
      (first_value..6).map { |second_value| dominoes << [first_value, second_value] }
    end

    def self.run
      shuffled_dominoes_values = DOMINOES_VALUES.shuffle

      (1..7).each_with_object(Pyramid) do |row_number, pyramid|
        row = Row.new(row_number)

        row_number.times do
          bone = Bone.new(*shuffled_dominoes_values.pop)
          bone.reveal! if [1,7].include?(row.number)

          row << bone
        end

        pyramid << row
      end
    end
  end
end
