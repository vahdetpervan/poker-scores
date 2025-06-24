require_relative '../flushable'

module Evaluators
  class Flush
    RANK = 5
    def self.match?(hand)
      Flushable.flush?(hand)
    end

    def self.rank(hand)
      [RANK] + hand.values.sort.reverse
    end
  end
end
