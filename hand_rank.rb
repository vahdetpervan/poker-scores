class HandRank
  include Comparable
  attr_reader :score

  EVALUATORS = [
    Evaluators::RoyalFlush,
    Evaluators::StraightFlush,
    Evaluators::FourOfAKind,
    Evaluators::FullHouse,
    Evaluators::Flush,
    Evaluators::Straight,
    Evaluators::ThreeOfAKind,
    Evaluators::TwoPair,
    Evaluators::OnePair,
    Evaluators::HighCard
  ]

  def self.for(hand)
    evaluator = EVALUATORS.find { |e| e.match?(hand) }
    raise "No evaluator matched hand" unless evaluator

    new(evaluator.rank(hand))
  end

  def initialize(score)
    @score = score
  end

  def <=>(other_hand_rank)
    score <=> other_hand_rank.score
  end
end
