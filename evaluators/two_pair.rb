module Evaluators
  class TwoPair
    RANK = 2
    def self.match?(hand)
      hand.value_counts.values.count(2) == 2
    end

    def self.rank(hand)
      pairs = hand.value_counts.select { |_, v| v == 2 }.keys.sort.reverse
      kicker = (hand.values - pairs).max
      [RANK] + pairs + [kicker]
    end
  end
end
