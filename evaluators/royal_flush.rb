require_relative '../flushable'

module Evaluators
  class RoyalFlush
    RANK = 9
    def self.match?(hand)
      Flushable.flush?(hand) && hand.values == [10, 11, 12, 13, 14]
    end

    def self.rank(_hand)
      [RANK]
    end
  end
end
