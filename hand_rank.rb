class HandRank
  include Comparable
  attr_reader :score

  def initialize(score)
    @score = score
  end

  def <=>(other_hand_rank)
    score <=> other_hand_rank.score
  end
end
