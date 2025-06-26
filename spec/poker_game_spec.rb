require_relative '../hand.rb'

RSpec.describe 'Poker Hand Ranking' do
  def build_hand(str)
    Hand.new(str.split)
  end

  it 'ranks Royal Flush highest over Four of a Kind' do
    h1 = build_hand("TH JH QH KH AH") # Royal Flush
    h2 = build_hand("9C 9D 9H 9S 7D") # Four of a Kind
    expect(HandRank.for(h1) > HandRank.for(h2)).to be true
  end

  it 'ranks Straight Flush over Four of a Kind' do
    h1 = build_hand("5H 6H 7H 8H 9H") # Straight Flush
    h2 = build_hand("8C 8D 8H 8S 2D") # Four of a Kind
    expect(HandRank.for(h1) > HandRank.for(h2)).to be true
  end

  it 'ranks Four of a Kind over Full House' do
    h1 = build_hand("8C 8D 8S 8H KD") # Four of a Kind
    h2 = build_hand("9H 9D 9C 7C 7D") # Full House
    expect(HandRank.for(h1) > HandRank.for(h2)).to be true
  end

  it 'ranks Full House over Flush' do
    h1 = build_hand("3H 3D 3C 6S 6H") # Full House
    h2 = build_hand("2H 4H 6H 9H KH") # Flush
    expect(HandRank.for(h1) > HandRank.for(h2)).to be true
  end

  it 'ranks Flush over Straight' do
    h1 = build_hand("2H 4H 6H 9H KH") # Flush
    h2 = build_hand("4C 5D 6S 7H 8C") # Straight
    expect(HandRank.for(h1) > HandRank.for(h2)).to be true
  end

  it 'ranks Straight over Three of a Kind' do
    h1 = build_hand("4C 5D 6S 7H 8C") # Straight
    h2 = build_hand("9C 9D 9S 3H 6D") # Three of a Kind
    expect(HandRank.for(h1) > HandRank.for(h2)).to be true
  end

  it 'ranks Three of a Kind over Two Pair' do
    h1 = build_hand("6H 6D 6S 4C 9D") # Three of a Kind
    h2 = build_hand("4H 4D 8S 8C JD") # Two Pair
    expect(HandRank.for(h1) > HandRank.for(h2)).to be true
  end

  it 'ranks Two Pair over One Pair' do
    h1 = build_hand("5C 5D 7S 7H 9H") # Two Pair
    h2 = build_hand("4C 4H 8S JD AH") # One Pair
    expect(HandRank.for(h1) > HandRank.for(h2)).to be true
  end

  it 'ranks One Pair over High Card' do
    h1 = build_hand("2C 2H 6S 8D QD") # One Pair
    h2 = build_hand("3H 5D 7C 9S JD") # High Card
    expect(HandRank.for(h1) > HandRank.for(h2)).to be true
  end

  it 'resolves tie with high card when same hand type' do
    h1 = build_hand("5C 5D 7S 9H KD") # One Pair, kicker King
    h2 = build_hand("5H 5S 7C 9D JD") # One Pair, kicker Jack
    expect(HandRank.for(h1) > HandRank.for(h2)).to be true
  end

  it 'detects true tie' do
    h1 = build_hand("2C 3D 5S 9H KH")
    h2 = build_hand("2C 3D 5S 9H KH")
    expect(HandRank.for(h1) > HandRank.for(h2)).to be false
    expect(HandRank.for(h2) > HandRank.for(h1)).to be false
  end
end
