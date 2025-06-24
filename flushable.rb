module Flushable
  def self.flush?(hand)
    hand.suits.uniq.size == 1
  end
end
