require_relative 'hand.rb'

class PokerGame
  def initialize(file_path)
    @file_path = file_path
  end

  def player_wins
    hand_one_wins, hand_two_wins = 0, 0
    File.foreach(@file_path) do |line|
      cards = line.strip.split
      hand1 = Hand.new(cards[0..4])
      hand2 = Hand.new(cards[5..9])
      HandRank.for(hand1) > HandRank.for(hand2) ? hand_one_wins += 1 : hand_two_wins += 1
    end
    "Player 1 total wins: #{hand_one_wins}, Player 2 total wins: #{hand_two_wins}"
  end
end
