require_relative '../straightable'

module Evaluators
  class Straight
    extend Straightable
    RANK = 4

    def self.match?(hand)
      Straightable.straight?(hand)
    end

    def self.rank(hand)
      [RANK, hand.values.max]
    end
  end
end
