module Evaluators
  class StraightFlush
    RANK = 8

    def self.match?(hand)
      Flushable.flush?(hand) && Straightable.straight?(hand)
    end

    def self.rank(hand)
      [RANK, hand.values.max]
    end
  end
end
