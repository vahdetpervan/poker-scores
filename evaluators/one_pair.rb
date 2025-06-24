module Evaluators
  class OnePair
    RANK = 1
    def self.match?(hand)
      hand.value_counts.values.count(2) == 1
    end

    def self.rank(hand)
      pair = hand.value_counts.find { |_, v| v == 2 }
      kickers = (hand.values - [pair]).sort.reverse
      [RANK, pair] + kickers
    end
  end
end
