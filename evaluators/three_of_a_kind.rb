module Evaluators
  class ThreeOfAKind
    RANK = 3
    def self.match?(hand)
      hand.value_counts.values.include?(3) && hand.value_counts.values.max == 3
    end

    def self.rank(hand)
      trips = hand.value_counts.find { |_, v| v == 3 }
      kickers = (hand.values - [trips]).sort.reverse
      [RANK, trips] + kickers
    end
  end
end
