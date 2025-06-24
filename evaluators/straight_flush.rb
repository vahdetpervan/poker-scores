require_relative '../flushable'
require_relative '../straightable'

module Evaluators
  class StraightFlush
    extend Straightable
    RANK = 8

    def self.match?(hand)
      Flushable.flush?(hand) && Straightable.straight?(hand)
    end

    def self.rank(hand)
      [RANK, hand.values.max]
    end
  end
end
