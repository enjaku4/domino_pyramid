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
      @@rows = []
    end
  end
end
