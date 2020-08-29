module Graphics
  module StatusDrawer
    def self.run(status)
      case status
      when :lost then Text.new('You lose', size: Store::Settings.font_size, color: 'red')
      when :won then Text.new('You win', size: Store::Settings.font_size, color: 'green')
      else raise UnknownStatusError, "unknown game status \'#{status}\'"
      end
    end

    class UnknownStatusError < StandardError;end
  end
end
