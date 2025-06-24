module Evaluators
  class HighCard
    RANK = 0
    def self.match?(_hand)
      true
    end

    def self.rank(hand)
      [RANK] + hand.values.sort.reverse
    end
  end
end
