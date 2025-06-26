require_relative 'evaluators/royal_flush'
require_relative 'evaluators/straight_flush'
require_relative 'evaluators/four_of_a_kind'
require_relative 'evaluators/full_house'
require_relative 'evaluators/flush'
require_relative 'evaluators/straight'
require_relative 'evaluators/three_of_a_kind'
require_relative 'evaluators/two_pair'
require_relative 'evaluators/one_pair'
require_relative 'evaluators/high_card'
require_relative 'card'
require_relative 'hand_rank'

class Hand
  attr_reader :cards

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

  def initialize(card_codes)
    @cards = card_codes.map { |code| Card.new(code) }
  end

  def values
    @cards.map(&:value).sort
  end

  def suits
    @cards.map(&:suit)
  end

  def value_counts
    values.tally
  end
end
