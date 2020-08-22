module Game
  module PyramidBuilder
    DOMINOES = (0..6).each_with_object([]) do |first_value, dominoes|
      (first_value..6).map { |second_value| dominoes << Bone.new(first_value, second_value) }
    end

    def self.run
      dominoes = DOMINOES.shuffle

      (1..7).each_with_object(Pyramid) do |row_number, pyramid|
        row = Row.new(row_number)
        row_number.times { row << dominoes.pop }
        pyramid << row
      end
    end
  end
end
