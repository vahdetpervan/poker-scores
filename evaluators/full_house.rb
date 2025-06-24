module Evaluators
  class FullHouse
    RANK = 6
    def self.match?(hand)
      hand.value_counts.values.sort == [2, 3]
    end

    def self.rank(hand)
      three = hand.value_counts.find { |_, v| v == 3 }
      pair = hand.value_counts.find { |_, v| v == 2 }
      [RANK, three, pair]
    end
  end
end
