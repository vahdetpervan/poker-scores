module Evaluators
  class FourOfAKind
    RANK = 7
    def self.match?(hand)
      hand.value_counts.values.include?(4)
    end

    def self.rank(hand)
      quad = hand.value_counts.find { |_, v| v == 4 }
      [RANK, quad]
    end
  end
end
