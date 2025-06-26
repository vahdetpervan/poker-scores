module Straightable
  def self.straight?(hand)
    sorted = hand.values
    sorted.each_cons(2).all? { |a, b| b == a + 1 }
  end
end